Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59FE6E04E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Dec 2020 07:06:49 +0000 (UTC)
Date: Mon, 14 Dec 2020 09:06:42 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201214070642.GZ7444@platvala-desk.ger.corp.intel.com>
References: <20201214035812.8224-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214035812.8224-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Added dynamic Subtest
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
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 09:28:12AM +0530, Nidhi Gupta wrote:
> Subject: [PATCH i-g-t] Added dynamic Subtest

A better description of what's getting changed in the subject line
please.

Something like

kms_atomic_transition: Convert nx-modeset-transitions subtest to dynamic

And remove a bit of the redundancy in the dynamic subtest naming. In
the current form we'd have

igt@kms_atomic_transition@modeset-transitions@2x-modeset-transitions

repeating the "modeset-transitions" part.

igt_dynamic_f("%ix-outputs", i)  maybe?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
