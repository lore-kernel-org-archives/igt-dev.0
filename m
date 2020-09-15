Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DA58864B
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2020 16:30:54 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 15 Sep 2020 09:30:39 -0700
From: abhinavk@codeaurora.org
In-Reply-To: <20200915073520.GT7444@platvala-desk.ger.corp.intel.com>
References: <20200904005439.17146-1-abhinavk@codeaurora.org>
 <20200904005439.17146-3-abhinavk@codeaurora.org>
 <20200915073520.GT7444@platvala-desk.ger.corp.intel.com>
Message-ID: <661e95723e8e0fed95b0062dbeb2dc90@codeaurora.org>
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] lib/igt_kms: move some of the
 useful dump functions to igt_kms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: khsieh@codeaurora.org, tanmay@codeaurora.org, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2020-09-15 00:35, Petri Latvala wrote:
> On Thu, Sep 03, 2020 at 05:54:36PM -0700, Abhinav Kumar wrote:
>> Some of the functions inside the intel_dp_compliance are
>> generic and can be used by other modules as well. Move these
>> to the igt_kms lib.
> 
> Please add documentation to the functions now that they go to lib.

Thanks so much for the review. Will add the documentation to the 
functions.

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
