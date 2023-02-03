Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41BC10E780
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 12:29:45 +0000 (UTC)
Date: Fri, 3 Feb 2023 14:29:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Message-ID: <Y9z+MXbsXHihUbfQ@intel.com>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
 <20230131120646.27434-7-ville.syrjala@linux.intel.com>
 <DM6PR11MB3177FB4C74D129995D9FB495BAD69@DM6PR11MB3177.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR11MB3177FB4C74D129995D9FB495BAD69@DM6PR11MB3177.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] tests/kms_async_flips: Test all
 modifiers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 11:23:09AM +0000, Murthy, Arun R wrote:
> > -----Original Message-----
> > From: Ville Syrjala <ville.syrjala@linux.intel.com>
> > Sent: Tuesday, January 31, 2023 5:37 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: [PATCH i-g-t 6/6] tests/kms_async_flips: Test all modifiers
> > 
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Run the basic async flip test for all modifiers reported by the plane (for the
> > XRGB8888 format). The driver may not support async flip with all modifiers
> > so we allow this to fail.
> 
> Support for adding X-tile and linear for all platforms is being added as sub-test in https://patchwork.freedesktop.org/series/103137/

I presume you mean:
https://patchwork.freedesktop.org/patch/515577/?series=107871&rev=11

That does nothing to get rid of the i915isms, nor does do
anything to test all the other modifiers (both now and in 
the future).

-- 
Ville Syrjälä
Intel
