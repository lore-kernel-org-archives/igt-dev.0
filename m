Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758086E2C8
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 11:35:59 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191218112012.3539911-1-chris@chris-wilson.co.uk>
 <43D4F724E12AB6478FC1572B3FBE89D076A5E829@IRSMSX106.ger.corp.intel.com>
In-Reply-To: <43D4F724E12AB6478FC1572B3FBE89D076A5E829@IRSMSX106.ger.corp.intel.com>
Message-ID: <157666895456.3924.13832076410522203025@skylake-alporthouse-com>
Date: Wed, 18 Dec 2019 11:35:54 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests: Open DRM_MASTER for display
 operations
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
To: "Saarinen, Jani" <jani.saarinen@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Saarinen, Jani (2019-12-18 11:31:38)
> Hi,
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Chris
> > Wilson
> > Sent: keskiviikko 18. joulukuuta 2019 13.20
> > To: igt-dev@lists.freedesktop.org
> > Subject: [igt-dev] [PATCH i-g-t] tests: Open DRM_MASTER for display operations
> > 
> > To configure the display, one is required to be the DRM_MASTER.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/intel/issues/855
> Is this change also for : https://gitlab.freedesktop.org/drm/intel/issues/844 ?

No. That is caused by a zombie test keeping hold of DRM_MASTER. It just
happens to be the same tests, but more likely an oops that is was
triggered by the earlier tests. igt_runner should be requesting a reboot
if it encounters a test it cannot kill.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
