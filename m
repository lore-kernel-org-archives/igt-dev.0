Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAC86E22E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2020 07:55:02 +0000 (UTC)
Date: Tue, 15 Sep 2020 10:35:20 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200915073520.GT7444@platvala-desk.ger.corp.intel.com>
References: <20200904005439.17146-1-abhinavk@codeaurora.org>
 <20200904005439.17146-3-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904005439.17146-3-abhinavk@codeaurora.org>
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] lib/igt_kms: move some of the
 useful dump functions to igt_kms
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
To: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: khsieh@codeaurora.org, tanmay@codeaurora.org, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 05:54:36PM -0700, Abhinav Kumar wrote:
> Some of the functions inside the intel_dp_compliance are
> generic and can be used by other modules as well. Move these
> to the igt_kms lib.

Please add documentation to the functions now that they go to lib.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
