Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401316E42D
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2020 13:29:05 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>) id 1jlubH-0002ML-Do
 for igt-dev@lists.freedesktop.org; Thu, 18 Jun 2020 16:29:03 +0300
Date: Thu, 18 Jun 2020 16:29:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200618132903.GM20883@platvala-desk.ger.corp.intel.com>
References: <20200618120623.6853-1-petri.latvala@intel.com>
 <159248666169.22459.8338803674968886107@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159248666169.22459.8338803674968886107@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D__runner=3A_Inject_a_message_wh?=
 =?utf-8?q?en_killing_test_to_taints?=
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 01:24:21PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] runner: Inject a message when killing test to taints
> URL   : https://patchwork.freedesktop.org/series/78526/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8641 -> IGTPW_4683
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4683:
> 
> ### IGT changes ###
> 
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@i915_selftest@live@execlists:
>     - {fi-tgl-dsi}:       [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/fi-tgl-dsi/igt@i915_selftest@live@execlists.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/fi-tgl-dsi/igt@i915_selftest@live@execlists.html

Ah, a good example of the taint-injection!


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
