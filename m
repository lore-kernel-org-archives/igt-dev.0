Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6547F6E981
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2020 08:54:18 +0000 (UTC)
Date: Fri, 7 Aug 2020 11:54:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200807085414.GC7444@platvala-desk.ger.corp.intel.com>
References: <20200806132935.23293-1-karthik.b.s@intel.com>
 <594bbda7-65ca-91d9-5a63-96f95bf9ac83@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <594bbda7-65ca-91d9-5a63-96f95bf9ac83@daenzer.net>
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_async_flips: Add test to
 validate asynchronous flips
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Cc: igt-dev@lists.freedesktop.org, daniel.vetter@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 06, 2020 at 04:49:19PM +0200, Michel D=E4nzer wrote:
> Also, the test as is can only run on Intel GPUs.


Karthik, is that the intention? (And if so, why?)

DRIVER_INTEL and the use of i915's X_TILED are the intel-specifics
that I spot, anything else in there?

Those need to be changed or the test moved to tests/i915/.

-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
