Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01046EC3A
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2020 10:12:45 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20200715145026.zvanrvlbamlalkbs@ahiler-desk1.fi.intel.com>
References: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
 <20200711200602.3217-11-mohammed.khajapasha@intel.com>
 <20200715145026.zvanrvlbamlalkbs@ahiler-desk1.fi.intel.com>
Date: Thu, 16 Jul 2020 13:12:38 +0300
Message-ID: <87tuy7zs2x.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 10/11] lib/kms: Convert pipe id flags
 for a vblank using crtc offset
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 15 Jul 2020, Arkadiusz Hiler <arkadiusz.hiler@intel.com> wrote:
> In KMS & i915 there are two thing that are called pipe:

...

> Is there any practical reason besides people wanting to have test
> results for pipe-c corresponding to Intel's hardware understanding of
> what pipe-c is?
>
> You may need to ELI5 that to me. I have very rudimentary understanding
> of this area and only learned about the multiple meanings of "pipe"
> while doing the review here :-)

Something I've been saying all along: If you call something a "pipe", it
*must* mean Intel hardware pipe. If you call something "crtc index", it
*must* mean the ABI crtc index. Don't mix the two. Don't implicitly
convert between the two (i.e. you need explicit conversion using the
IOCTL). Assume it's purely a coincidence that they've previously matched
1:1.

In this case, naming is everything, and proper naming leads to clarity
of the concepts and implementation.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
