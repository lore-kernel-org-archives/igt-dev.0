Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A006810E52E
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 14:02:41 +0000 (UTC)
Date: Wed, 28 Sep 2022 17:02:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <YzRT89c7EcT44KJo@intel.com>
References: <20220928060601.12941-1-ville.syrjala@linux.intel.com>
 <87tu4ry6q3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tu4ry6q3.fsf@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_frontbuffer_tracking:
 Check compression state on all gens
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 04:21:56PM +0300, Jani Nikula wrote:
> On Wed, 28 Sep 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > The compression status has been available on all platforms
> > since commit 3fd5d1ecae2d ("drm/i915: Implement fbc_status
> > "Compressing" info for all platforms") in the kernel. Make
> > use of it.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> On the series,
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> didn't review all the details.
> 
> I guess we've deciced in the past it's fine to break testing for older
> kernels...?

Not really. Petri at least has been asking people to keep slightly
older kernels working (I guess for -fixes testing and whatnot). 
But in this case I broke the kernel side already a while ago,
so I don't think anything really works atm.

-- 
Ville Syrjälä
Intel
