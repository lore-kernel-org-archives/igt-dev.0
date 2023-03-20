Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCF410E07D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 17:08:41 +0000 (UTC)
Date: Mon, 20 Mar 2023 18:08:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230320170836.zinue6kz6jl7e3dr@kamilkon-desk1>
References: <20230316022659.73202-1-zack@kde.org>
 <20230316022659.73202-2-zack@kde.org>
 <DM6PR05MB7099753BF0C4C180B50FE6F5AEBC9@DM6PR05MB7099.namprd05.prod.outlook.com>
 <ad68adc5-5741-2057-7247-87c5878ad88c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad68adc5-5741-2057-7247-87c5878ad88c@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/8] igt/vmwgfx: Add generated
 headers for svga device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: banackm@vmware.com, krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-03-16 at 15:03:56 +0200, Martin Krastev (VMware) wrote:
> From: Martin Krastev <krastevm@vmware.com>
> 
> 
> LGTM
> 
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> 
> 
> Regards,
> 
> Martin

Please note new Petri e-mail:
Petri Latvala <adrinael@adrinael.net>

Regards,
Kamil

> 
> 
> On 16.03.23 г. 14:58 ч., Martin Krastev wrote:
> > From: Maaz Mombasawala <mombasawalam@vmware.com>
> > 
> > Add generated headers for svga device which will be used
> > to interface with the vmwgfx driver.
> > 
> > Signed-off-by: Roye Eshed <reshed@vmware.com>
> > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
> > ---
> >   lib/svga/svga3d_cmd.h         | 1511 +++++++++++++++++++++++++++++
> >   lib/svga/svga3d_devcaps.h     |  369 +++++++
> >   lib/svga/svga3d_dx.h          | 1722 +++++++++++++++++++++++++++++++++
> >   lib/svga/svga3d_limits.h      |   83 ++
> >   lib/svga/svga3d_reg.h         |   44 +
> >   lib/svga/svga3d_surfacedefs.h | 1559 +++++++++++++++++++++++++++++
> >   lib/svga/svga3d_types.h       | 1554 +++++++++++++++++++++++++++++
> >   lib/svga/svga_escape.h        |   54 ++
> >   lib/svga/svga_overlay.h       |  115 +++
> >   lib/svga/svga_reg.h           |  897 +++++++++++++++++
> >   lib/svga/vm_basic_types.h     |  161 +++
[...]
