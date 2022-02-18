Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9BE10F07E
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 13:22:21 +0000 (UTC)
Date: Fri, 18 Feb 2022 14:22:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yg+diOZTApGLm5Es@kamilkon-DESK1>
References: <20220215142304.120586-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215142304.120586-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/debugfs_test: Added test
 description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Melkaveri@kamilkon-desk1
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Priyanka,

Dnia 2022-02-15 at 19:53:04 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2:rebase
> 
> Cc: Katarzyna Dec <katarzyna.dec@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/debugfs_test.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
> index e6535ccd..0aa312dc 100644
> --- a/tests/debugfs_test.c
> +++ b/tests/debugfs_test.c
> @@ -29,6 +29,8 @@
>  #include <sys/types.h>
>  #include <dirent.h>
>  
> +IGT_TEST_DESCRIPTION("Test reads entries from debugfs and sysfs path.");
> +
s/Test reads/Read/
s/path/paths/

Please avoid starting description with "Test" or "This test".

>  static void read_and_discard_sysfs_entries(int path_fd, int indent)
>  {
>  	struct dirent *dirent;
> @@ -187,11 +189,13 @@ igt_main
>  		kmstest_set_vt_graphics_mode();
>  	}
>  
> +	igt_describe("Test reads all entries from sysfs path.");

s/Test reads/Read/

>  	igt_subtest("sysfs")
>  		read_and_discard_sysfs_entries(sysfs, 0);
> +	igt_describe("Test reads all entries from debugfs path.");

s/Test reads/Read/

>  	igt_subtest("read_all_entries")
>  		read_and_discard_sysfs_entries(debugfs, 0);
> -
> +	igt_describe("Test reads all debugfs entries with display on/off.");

s/Test reads/Read/

>  	igt_subtest_group
>  		kms_tests(fd, debugfs);
>  
> -- 
> 2.25.1
>

Regards,
Kamil
 
