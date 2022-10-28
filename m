Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32B810E83F
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 13:52:12 +0000 (UTC)
Date: Fri, 28 Oct 2022 15:52:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y1veiKhF4ScmaC9s@kamilkon-desk1>
References: <20221010145708.1986912-1-petri.latvala@intel.com>
 <20221010145708.1986912-6-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221010145708.1986912-6-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/7] runner: Add a socket comms decoder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-10-10 at 17:57:07 +0300, Petri Latvala wrote:
> When debugging, being able to read what is sent via socket comms is
> very useful.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  runner/decoder.c   | 131 +++++++++++++++++++++++++++++++++++++++++++++
>  runner/meson.build |   8 +++
>  2 files changed, 139 insertions(+)
>  create mode 100644 runner/decoder.c
> 
> diff --git a/runner/decoder.c b/runner/decoder.c
> new file mode 100644
> index 00000000..850b6ad5
> --- /dev/null
> +++ b/runner/decoder.c
> @@ -0,0 +1,131 @@
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +
> +#include "runnercomms.h"
> +
> +static bool handle_log(const struct runnerpacket *packet, runnerpacket_read_helper helper, void *userdata)
> +{
> +	printf("(pid=%d tid=%d) LOG\tstream=%d,text=%s",
> +	       packet->senderpid, packet->sendertid,
> +	       helper.log.stream, helper.log.text);
> +	if (strlen(helper.log.text) == 0 || helper.log.text[strlen(helper.log.text) - 1] != '\n')
> +		printf("\n");
> +
> +	return true;
> +}
> +
> +static bool handle_exec(const struct runnerpacket *packet, runnerpacket_read_helper helper, void *userdata)
> +{
> +	printf("(pid=%d tid=%d) EXEC\tcmdline=%s\n",
> +	       packet->senderpid, packet->sendertid,
> +	       helper.exec.cmdline);
> +
> +	return true;
> +}
> +
> +static bool handle_exit(const struct runnerpacket *packet, runnerpacket_read_helper helper, void *userdata)
> +{
> +	printf("(pid=%d tid=%d) EXIT\texitcode=%d,timeused=%s\n",
> +	       packet->senderpid, packet->sendertid,
> +	       helper.exit.exitcode, helper.exit.timeused);
> +
> +	return true;
> +}
> +
> +static bool handle_subtest_start(const struct runnerpacket *packet, runnerpacket_read_helper helper, void *userdata)
> +{
> +	printf("(pid=%d tid=%d) SUBTEST_START\tname=%s\n",
> +	       packet->senderpid, packet->sendertid,
> +	       helper.subteststart.name);
> +
> +	return true;
> +}
> +
> +static bool handle_subtest_result(const struct runnerpacket *packet, runnerpacket_read_helper helper, void *userdata)
> +{
> +	printf("(pid=%d tid=%d) SUBTEST_RESULT\tname=%s,result=%s,timeused=%s,reason=%s\n",
> +	       packet->senderpid, packet->sendertid,
> +	       helper.subtestresult.name,
> +	       helper.subtestresult.result,
> +	       helper.subtestresult.timeused,
> +	       helper.subtestresult.reason ?: "<null>");
> +
> +	return true;
> +}
> +
> +static bool handle_dynamic_subtest_start(const struct runnerpacket *packet, runnerpacket_read_helper helper, void *userdata)
> +{
> +	printf("(pid=%d tid=%d) DYNAMIC_SUBTEST_START\tname=%s\n",
> +	       packet->senderpid, packet->sendertid,
> +	       helper.dynamicsubteststart.name);
> +
> +	return true;
> +}
> +
> +static bool handle_dynamic_subtest_result(const struct runnerpacket *packet, runnerpacket_read_helper helper, void *userdata)
> +{
> +	printf("(pid=%d tid=%d) DYNAMIC_SUBTEST_RESULT\tname=%s,result=%s,timeused=%s,reason=%s\n",
> +	       packet->senderpid, packet->sendertid,
> +	       helper.dynamicsubtestresult.name,
> +	       helper.dynamicsubtestresult.result,
> +	       helper.dynamicsubtestresult.timeused,
> +	       helper.dynamicsubtestresult.reason ?: "<null>");
> +
> +	return true;
> +}
> +
> +static bool handle_versionstring(const struct runnerpacket *packet, runnerpacket_read_helper helper, void *userdata)
> +{
> +	printf("(pid=%d tid=%d) VERSIONSTRING\ttext=%s",
> +	       packet->senderpid, packet->sendertid,
> +	       helper.versionstring.text);
> +	if (strlen(helper.versionstring.text) == 0 || helper.versionstring.text[strlen(helper.versionstring.text) - 1] != '\n')
> +		printf("\n");
> +
> +	return true;
> +}
> +
> +static bool handle_result_override(const struct runnerpacket *packet, runnerpacket_read_helper helper, void *userdata)
> +{
> +	printf("pid=%d tid=%d) RESULT_OVERRIDE\tresult=%s\n",
> +	       packet->senderpid, packet->sendertid,
> +	       helper.resultoverride.result);
> +
> +	return true;
> +}
> +
> +struct comms_visitor logger = {
> +	.log = handle_log,
> +	.exec = handle_exec,
> +	.exit = handle_exit,
> +	.subtest_start = handle_subtest_start,
> +	.subtest_result = handle_subtest_result,
> +	.dynamic_subtest_start = handle_dynamic_subtest_start,
> +	.dynamic_subtest_result = handle_dynamic_subtest_result,
> +	.versionstring = handle_versionstring,
> +	.result_override = handle_result_override,
> +};
> +
> +int main(int argc, char **argv)
> +{
> +	int fd;
> +
> +	if (argc < 2) {
> +		printf("Usage: %s igt-comms-data-file\n", argv[0]);
> +		return 2;
> +	}
> +
> +	fd = open(argv[1], O_RDONLY);
> +	if (fd < 0) {
> +		fprintf(stderr, "Failure opening %s: %m\n", argv[1]);
> +		return 1;
> +	}
> +
> +	comms_read_dump(fd, &logger);
> +
> +	return 0;
> +}
> diff --git a/runner/meson.build b/runner/meson.build
> index c3927af5..dadfc75f 100644
> --- a/runner/meson.build
> +++ b/runner/meson.build
> @@ -10,6 +10,7 @@ runnerlib_sources = [ 'settings.c',
>  runner_sources = [ 'runner.c' ]
>  resume_sources = [ 'resume.c' ]
>  results_sources = [ 'results.c' ]
> +decoder_sources = [ 'decoder.c' ]
>  runner_test_sources = [ 'runner_tests.c' ]
>  runner_json_test_sources = [ 'runner_json_tests.c' ]
>  
> @@ -56,6 +57,13 @@ if jsonc.found()
>  			     install_rpath : bindir_rpathdir,
>  			     dependencies : igt_deps)
>  
> +	decoder = executable('igt_comms_decoder', decoder_sources,
> +			     link_with : runnerlib,
> +			     install : true,
> +			     install_dir : bindir,
> +			     install_rpath : bindir_rpathdir,
> +			     dependencies : igt_deps)
> +
>  	runner_test = executable('runner_test', runner_test_sources,
>  				 c_args : '-DTESTDATA_DIRECTORY="@0@"'.format(testdata_dir),
>  				 link_with : runnerlib,
> -- 
> 2.30.2
> 
