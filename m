Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4382610E2B4
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jan 2024 15:10:37 +0000 (UTC)
Date: Wed, 3 Jan 2024 16:10:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] intel-ci: remove chamelium/psr blacklists
Message-ID: <20240103151033.ja4hspc75wovyyur@kamilkon-desk.igk.intel.com>
References: <20231228164744.34827-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231228164744.34827-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2023-12-28 at 22:17:44 +0530, Swati Sharma wrote:
> Chamelium and PSR blacklists are not required.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/chamelium.blacklist | 1 -
>  tests/intel-ci/meson.build         | 2 --
>  tests/intel-ci/psr.blacklist       | 1 -
>  3 files changed, 4 deletions(-)
>  delete mode 100644 tests/intel-ci/chamelium.blacklist
>  delete mode 100644 tests/intel-ci/psr.blacklist
> 
> diff --git a/tests/intel-ci/chamelium.blacklist b/tests/intel-ci/chamelium.blacklist
> deleted file mode 100644
> index c0325b555..000000000
> --- a/tests/intel-ci/chamelium.blacklist
> +++ /dev/null
> @@ -1 +0,0 @@
> -igt@.*chamelium.*
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 964738cc8..f16243cbb 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -4,12 +4,10 @@ intelci_files = [
>    'README',
>    'blacklist.txt',
>    'blacklist-pre-merge.txt',
> -  'chamelium.blacklist',
>    'chamelium-only.testlist',
>    'fast-feedback.testlist',
>    'fast-feedback-chamelium-only.testlist',
>    'meta.testlist',
> -  'psr.blacklist',
>    'xe.blocklist.txt',
>    'xe-fast-feedback.testlist',
>    'xe-fast-feedback-chamelium-only.testlist',
> diff --git a/tests/intel-ci/psr.blacklist b/tests/intel-ci/psr.blacklist
> deleted file mode 100644
> index 8356a92f7..000000000
> --- a/tests/intel-ci/psr.blacklist
> +++ /dev/null
> @@ -1 +0,0 @@
> -igt@.*psr.*
> -- 
> 2.25.1
> 
