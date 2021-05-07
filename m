Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221506E0B6
 for <igt-dev@lists.freedesktop.org>; Fri,  7 May 2021 16:53:24 +0000 (UTC)
From: "Hagaragi, Arundhati" <arundhati.hagaragi@intel.com>
Date: Fri, 7 May 2021 16:53:03 +0000
Message-ID: <DM6PR11MB316297AA9614CCC63CBB33048B579@DM6PR11MB3162.namprd11.prod.outlook.com>
References: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
 <YJVI05LGuzs3CmCY@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YJVI05LGuzs3CmCY@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_lease: Add subtest description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com> 
Sent: Friday, May 7, 2021 7:34 PM
To: Hagaragi, Arundhati <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_lease: Add subtest description

On Fri, May 07, 2021 at 06:20:39PM +0530, Arundhati Hagaragi wrote:
> Added description for subtest
> 
> Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> ---
>  tests/kms_lease.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c index 
> 6397ef8f..957af1e0 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -1307,6 +1307,7 @@ igt_main
>  
>  	for (f = funcs; f->name; f++) {
>  
> +		igt_describe("Tests the valid crtc/connector combinations for given 
> +function");


That doesn't help at all. You need to document what each of those functions do, separately.

Add a description to each of the elements in the funcs array so you can do

for (f = funcs; f->name; f++) {
  igt_describe("%s", f->desc);
  igt_subtest_f("%s", f->name) {
     run_test(&data, f->func);
  }
}


--
Petri Latvala

Thanks Petri, Will look into it.

Thanks,
Arundhati
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
