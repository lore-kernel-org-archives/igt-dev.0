Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887C56E1A7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 13:49:50 +0000 (UTC)
Date: Tue, 17 Aug 2021 16:52:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YRu/JcN3h88oXvRh@platvala-desk.ger.corp.intel.com>
References: <20210817134523.1390961-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817134523.1390961-1-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] tests/kms_plane_*: Reset display
 before execution tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 04:45:21PM +0300, Mika Kahola wrote:
> Reset display before executing tests. This way display state is
> in known state even if the previous test has failed.

I was going to suggest having reset in the common display
initialization but it is there already. When do you see this kind of a
thing happening for these tests? When running multiple subtests at
once?


-- 
Petri Latvala


> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> 
> Mika Kahola (2):
>   tests/kms_plane_multiple: Reset display before testing
>   tests/kms_plane_lowres: Reset display before testing
> 
>  tests/kms_plane_lowres.c   | 2 ++
>  tests/kms_plane_multiple.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> -- 
> 2.27.0
> 
