Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5070C6E222
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Aug 2021 07:44:16 +0000 (UTC)
Date: Thu, 5 Aug 2021 09:44:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210805074411.GC3295@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-9-zbigniew.kempczynski@intel.com>
 <87eeb8u3zu.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87eeb8u3zu.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 08/52] lib/huc_copy: Extend huc copy
 prototype to pass allocator handle
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 04, 2021 at 05:31:01PM -0700, Dixit, Ashutosh wrote:
> On Mon, 26 Jul 2021 12:59:42 -0700, Zbigniew Kempczyński wrote:
> >
> > @@ -86,6 +90,21 @@ gen9_huc_copyfunc(int fd,
> >	buf[i++] = MFX_WAIT;
> >
> >	memset(reloc, 0, sizeof(reloc));
> > +
> > +	if (ahnd) {
> > +		obj[0].flags = EXEC_OBJECT_PINNED;
> > +		obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> > +		obj[2].flags = EXEC_OBJECT_PINNED;
> 
> Don't need | EXEC_OBJECT_SUPPORTS_48B_ADDRESS here?
> 
> Otherwise this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

gen9_emit_huc_virtual_addr_state() currently sets only first dword with
offset (other two buf[(*i)++] = 0; are intact).

This is only used within gem_huc_copy.c and I know offsets passed starts
from 0x0 and won't exceed 32-bit I left it with without 48B_ADDRESS set.

--
Zbigniew
