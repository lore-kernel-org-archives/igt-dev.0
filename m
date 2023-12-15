Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B99610EA92
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 21:11:35 +0000 (UTC)
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
Subject: RE: [PATCH i-g-t v7 5/6] lib/xe/xe_util: Align obj size before
 bind/unbind
Date: Fri, 15 Dec 2023 21:11:31 +0000
Message-ID: <CH0PR11MB5444F19966A5413361BAAC2AE593A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <cover.1702674322.git.akshata.jahagirdar@intel.com>
 <bc8dbf562ddfacda2deb52dfd68be6ce675656aa.1702674322.git.akshata.jahagirdar@intel.com>
 <CO1PR11MB49777592D5F03D1454FAB0278D93A@CO1PR11MB4977.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB49777592D5F03D1454FAB0278D93A@CO1PR11MB4977.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Jahagirdar,
 Akshata" <akshata.jahagirdar@intel.com>, "Siddiqui,
 Ayaz A" <ayaz.siddiqui@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

-----Original Message-----
> From: Jahagirdar, Akshata <akshata.jahagirdar@intel.com>=20
> Sent: Friday, December 15, 2023 1:10 PM
> Cc: igt-dev@lists.freedesktop.org; Siddiqui, Ayaz A <ayaz.siddiqui@intel.=
com>; Mishra, Pallavi <pallavi.mishra@intel.com>; akshata.jahagirdar@intel.=
co; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Auld, Matthew <=
matthew.auld@intel.com>; Jahagirdar, Akshata <akshata.jahagirdar@intel.com>
> Subject: [PATCH i-g-t v7 5/6] lib/xe/xe_util: Align obj size before bind/=
unbind
>=20
> Alter the range to default_alignment before vm bind/unbind operation to a=
lign the buffer object size with page size.
>=20
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  lib/xe/xe_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c index ba8eece71..6321a57=
29 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -148,7 +148,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(in=
t xe,
>  		ops->flags =3D flags;
>  		ops->obj_offset =3D 0;
>  		ops->addr =3D obj->offset;
> -		ops->range =3D obj->size;
> +		ops->range =3D ALIGN(obj->size, 4096);


Hrmm... I was briefly concerned with us hard-coding the page size here, but=
 it looks like we do so in
a lot of places in the code, so I guess there's precedent.
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt


>  		ops->prefetch_mem_region_instance =3D 0;
>  		if (obj->pat_index =3D=3D DEFAULT_PAT_INDEX)
>  			ops->pat_index =3D intel_get_pat_idx_wb(xe);
> --
> 2.34.1
>=20
>=20
