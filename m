Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948FB6E8FC
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Apr 2021 06:16:26 +0000 (UTC)
Date: Tue, 27 Apr 2021 09:17:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YIesgRTh1n1JRLTz@platvala-desk.ger.corp.intel.com>
References: <20210427054219.21305-1-petri.latvala@intel.com>
 <e753b43c0a134041b0d1f5f3ee06649b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e753b43c0a134041b0d1f5f3ee06649b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Put edid_ar_svds where it's used
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
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 08:43:07AM +0300, Joshi, Kunal1 wrote:
> From: Latvala, Petri <petri.latvala@intel.com> 
> Sent: Tuesday, April 27, 2021 11:12 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Latvala, Petri <petri.latvala@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t] lib: Put edid_ar_svds where it's used
> 
> edid_ar_svds was hiding in igt_chamelium instead of igt_kms where it's used, breaking IGT building when chamelium support was disabled.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>


Thanks, merged after checking that this indeed fixes all gitlab side
tests and doesn't cause new ones.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
