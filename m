Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A824110E4B6
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 10:43:21 +0000 (UTC)
Message-ID: <9edf8d07-ccec-0326-b742-f39392f4c2f2@quicinc.com>
Date: Thu, 19 Oct 2023 03:43:14 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20211208192216.743364-1-robdclark@gmail.com>
 <20211208192216.743364-3-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211208192216.743364-3-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH igt 2/2] tools/msm_dp_compliance: Add arg to
 specify connector name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

<reviving this>

On 12/8/2021 11:22 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> To support multiple DP connectors, the debugfs files will be moving into
> a per-connector subdirectory in debugfs.  So add an arg to specify the
> appropriate connector name.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Nit: shouldnt the patch prefix be "PATCH i-g-t" ?

We will test this out next week and land this.

> ---
>   tools/msm_dp_compliance.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
> index a15a8dd9..bc79a061 100644
> --- a/tools/msm_dp_compliance.c
> +++ b/tools/msm_dp_compliance.c
> @@ -205,10 +205,15 @@ static FILE *fopenat(int dir, const char *name, const char *mode)
>   	return fdopen(fd, mode);
>   }
>   
> -static void setup_debugfs_files(void)
> +static void setup_debugfs_files(const char *connector_name)
>   {
>   	int dir = igt_debugfs_dir(drm_fd);
>   
> +	if (connector_name) {
> +		dir = openat(dir, connector_name, O_RDONLY);
> +		igt_require(dir >= 0);
> +	}
> +
>   	test_type_fp = fopenat(dir, MSM_DP_TEST_TYPE_FILE, "r");
>   	igt_require(test_type_fp);
>   
> @@ -624,11 +629,12 @@ int update_display(int mode, bool is_compliance_test)
>   	return ret;
>   }
>   
> -static const char optstr[] = "hi";
> +static const char optstr[] = "c:hi";
>   
>   static void __attribute__((noreturn)) usage(char *name, char opt)
>   {
> -	igt_info("usage: %s [-hi]\n", name);
> +	igt_info("usage: %s [-hi] [-c NAME]\n", name);
> +	igt_info("\t-c, --connector=NAME - specify connector name");
>   	igt_info("\t-h, --help           - print this usage message");
>   	igt_info("\t--help-description   - print test description");
>   	igt_info("\t-i, --info           - dump info\n");
> @@ -708,7 +714,9 @@ int main(int argc, char **argv)
>   	GIOChannel *stdinchannel, *testactive_channel;
>   	GMainLoop *mainloop;
>   	bool opt_dump_info = false;
> +	char *opt_connector_name = NULL;
>   	struct option long_opts[] = {
> +		{"connector", 1, 0, 'c'},
>   		{"help-description", 0, 0, HELP_DESCRIPTION},
>   		{"help", 0, 0, 'h'},
>   		{"info", 0, 0, 'i'},
> @@ -718,6 +726,9 @@ int main(int argc, char **argv)
>   
>   	while ((c = getopt_long(argc, argv, optstr, long_opts, NULL)) != -1) {
>   		switch (c) {
> +		case 'c':
> +			opt_connector_name = optarg;
> +			break;
>   		case 'i':
>   			opt_dump_info = true;
>   			break;
> @@ -739,7 +750,7 @@ int main(int argc, char **argv)
>   	drm_fd = drm_open_driver(DRIVER_ANY);
>   
>   	kmstest_set_vt_graphics_mode();
> -	setup_debugfs_files();
> +	setup_debugfs_files(opt_connector_name);
>   	cleanup_test();
>   	if (opt_dump_info) {
>   		dump_info();
