Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC22810E3DE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 13:18:21 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bi9so27663042lfb.12
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 06:18:21 -0700 (PDT)
Date: Thu, 23 Mar 2023 15:18:18 +0200
From: Petri Latvala <adrinael@adrinael.net>
Message-ID: <ZBxRmoHBOIlnWqlB@adrinael.net>
References: <20230322072947.1760988-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322072947.1760988-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: update blacklists to work
 with the Xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 08:29:47AM +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> It doesn't make sense to run i915 tests with Xe driver and
> vice-versa. Update testlists to make it clear.
> 
> In order to avoid disrupts at exiting intel-ci tests, keep a
> symlink:
> 	i915-blacklist.txt -> blacklist.txt
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel-ci/blacklist.txt      | 130 +----------------------------
>  tests/intel-ci/i915-blacklist.txt | 133 ++++++++++++++++++++++++++++++
>  tests/intel-ci/xe-blacklist.txt   |  21 +++++
>  3 files changed, 155 insertions(+), 129 deletions(-)
>  mode change 100644 => 120000 tests/intel-ci/blacklist.txt
>  create mode 100644 tests/intel-ci/i915-blacklist.txt
>  create mode 100644 tests/intel-ci/xe-blacklist.txt

Since a rename is happening anyway, let's rename to inclusive language
at the same time? i915-blocklist.txt + xe-blocklist.txt


-- 
Petri Latvala

