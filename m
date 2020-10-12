Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084876E4A1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2020 15:06:19 +0000 (UTC)
Date: Mon, 12 Oct 2020 18:06:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201012150614.GR7444@platvala-desk.ger.corp.intel.com>
References: <20201008180559.1025-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201008180559.1025-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_addfb_basic: Renaming
 tests as legacy tiling
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 08, 2020 at 11:35:59PM +0530, Swati Sharma wrote:
> Tests require legacy get_tiling/set_tiling API's. Renaming the subtest
> names to make it obvious that these are legacy-only tests.
> 
> v2: Made test name consistent (Matt)
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Acked-by: Matt Roper <matthew.d.roper@intel.com>


You need to change the kms_addfb_basic test names on
fast-feedback.testlist too.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
