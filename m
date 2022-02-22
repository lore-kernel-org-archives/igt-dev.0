Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6D910E816
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Feb 2022 14:55:17 +0000 (UTC)
Date: Tue, 22 Feb 2022 15:55:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YhT5UR4chg99bZjR@kamilkon-DESK1>
References: <20220222124536.19369-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220222124536.19369-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v3] tests/debugfs_test: Added test description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Priyanka,
 
Dnia 2022-02-22 at 18:15:36 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2: rebase
> 
> v3: Updated test descriptions.
> 
> Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/debugfs_test.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
> index e6535ccd..deb58f10 100644
> --- a/tests/debugfs_test.c
> +++ b/tests/debugfs_test.c
> @@ -29,6 +29,8 @@
>  #include <sys/types.h>
>  #include <dirent.h>
>  
> +IGT_TEST_DESCRIPTION("Read entries from debugfs and sysfs paths.");
> +
>  static void read_and_discard_sysfs_entries(int path_fd, int indent)
>  {
>  	struct dirent *dirent;
> @@ -187,11 +189,13 @@ igt_main
>  		kmstest_set_vt_graphics_mode();
>  	}
>  
> +	igt_describe("Read all entries from sysfs path.");
>  	igt_subtest("sysfs")
>  		read_and_discard_sysfs_entries(sysfs, 0);
> +	igt_describe("Read all entries from debugfs path.");
>  	igt_subtest("read_all_entries")
>  		read_and_discard_sysfs_entries(debugfs, 0);
> -

Please keep this newline here, it separates tests from subtets group.

> +	igt_describe("Read all debugfs entries with display on/off.");
>  	igt_subtest_group
>  		kms_tests(fd, debugfs);
>  
> -- 
> 2.25.1
>
With that fixed you can add my r-b.

Regards,
Kamil
 
