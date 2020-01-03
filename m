Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733856E1BC
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2020 10:44:48 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200103103022.13889-1-anshuman.gupta@intel.com>
References: <20200103103022.13889-1-anshuman.gupta@intel.com>
Message-ID: <157804827132.2994.9490134519877964337@skylake-alporthouse-com>
Date: Fri, 03 Jan 2020 10:44:31 +0000
Subject: Re: [igt-dev] [PATCH RFC i-g-t] kms_content_protection: use delay
 for few panels which don't respond for AKE cert read.
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
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: Suresh Kumar Kurmi <suresh.kumar.kurmi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Anshuman Gupta (2020-01-03 10:30:22)
> While running HDCP igt tests with some panels like Accer CB281HK,
> panel state machine enters to bad state such that they won't respond
> to AKE cert read request properly until unless they are being
> power cycle off/on.
> These panels doesn't seems to handle back to back HDCP authentication
> request, using a delay of 1 seconds before enabling HDCP reduced the
> reproduction rate. Using 100ms delay in i915 driver before AKE cert read
> also fixes this issue, it is safer to use delay in IGT for HDCP tests
> for these panels.

HW misbehaves, so workaround in userspace? That does not bode well.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
