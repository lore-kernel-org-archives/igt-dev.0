Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B387C6E850
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 07:34:36 +0000 (UTC)
Date: Thu, 23 Jul 2020 10:34:33 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200723073433.GT20883@platvala-desk.ger.corp.intel.com>
References: <20200722134758.26412-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722134758.26412-1-pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_big_fb: Use igt_assert on
 bufmgr
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
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 07:17:58PM +0530, Pankaj Bharadiya wrote:
> NULL bufmgr pointer leads to SIGSEGV. Assert on NULL bufmgr so that
> correct failure reason will get dumped in the stack trace.
> 
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>


Reviewed-by: Petri Latvala <petri.latvala@intel.com>

(For the audience following along; libdrm_intel usage is still on its
way out slowly but surely)
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
