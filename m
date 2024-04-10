Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82904CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 15:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A7910EAC4;
	Wed, 10 Apr 2024 15:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PasaTb3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CECE10EAC4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712764169; x=1744300169;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6Noe0wFF6FVq9E9Zo3ldPPY8JoQf9MLgbGBH9lfMam8=;
 b=PasaTb3fwJiJUJn26uH2HkqySwkbuJdVVcQuOu1EbfpwQdr2tCqahJV1
 ZruV+lQfrVCnfprEbxODtXL0VVMFTBCg9wOOXVFAyTkwGi7Sppx41q+pp
 6HBp3XygvO5r4kiQziLXxmZZxfKTDn3uVuxZRkWWkDbcXdl2GjAzcbrUO
 9bH9Q7GKMed+8YB+ubr4S+48s0AtTtLIF5xONsVD63JnKt4YbP5iGDqMI
 qwYOhY0Lq8HjO+Qkhr5vYabVi9Fhs3oF+GnGa8qBD/Iq1cs0GPZpUIVJm
 QA0TyrhvvfDaZorPD0oV2qjG4TWOI+HJB8mvpIhyLTsQkzJe0h451a5T6 g==;
X-CSE-ConnectionGUID: psw7f7/iSsufgdz3qGvYIg==
X-CSE-MsgGUID: R/v5MyTfQ2CjCk4FumS58A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8310869"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8310869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:49:27 -0700
X-CSE-ConnectionGUID: hTGJ8LmVTuKBufi/3b9kOA==
X-CSE-MsgGUID: Xh3rGIYGSru/OdtRy97J2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25359135"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 08:49:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 08:49:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 08:49:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 08:49:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/oi9d61t5W+FcMeHDYVJ8umU74RVv6vufSpd5IRefsA0Mc6w5dc/MdoTSnQrbBEHr+WfAZKIHsgTxl/xA/vYplXykXocf/i3KlJfQt3DRxV7nlMEP/H5hF83yeD3zpaJunM3LP+Fn9zZkOBZfKOn/yrQJQCm5qL9ZnxpDtBsrrHY4S29MhYwjp0vEqz8E2VFal2xNH9o/vwmorxBZ6GjOI1/1ut6ggVqFBSYgU+J9dyQ3F4jUwL3C2CCsqpbm1IbO+ya8WZ3QVjZYeuOwmD1oYYs1x0R3/hR7XJgM7CE+LJkMJqUGRmiikXb5CDjSweGVfB/HZtvqnXnC8HP8VGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnjkqiLNjJ4YmfL/Nq9RdRJF82nUtBeyaW1hktn3TsM=;
 b=bWG6O0NNVnSQKqJsKRS6JEphQp1dQN6b0IX01yB6+PaWXhJ/CI1JHbf8patAjm4dL8ZivsTBi2GdzDegtHabstZ90609qfOpLD9NDFqWbnnkXI2dut0L14Zh1I3UudakG+Z6DJI9irkLBaWs4cy3yiPS7VTlPsUgbEKB4J3W6rGW7KFoDWxF+xxhdJOVtTN9OjWMO2VNfWxnIv3B//RvgilToIQDqk6V/TmCt8MjLkyBgiLqINEhE1Ger+29BGJBszd7tT44J1riJtWg9Vb9yQbSSyBzzM/0IHnPyvupq7E9VK/3Q3UVhjJ0wS41KrGU/NI8osda+K6If/5jHiA10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7354.namprd11.prod.outlook.com (2603:10b6:208:434::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 15:49:23 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7472.007; Wed, 10 Apr 2024
 15:49:23 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] Revert "tests/intel/xe_vm: Do not error on -ECANCELED"
Thread-Topic: [PATCH] Revert "tests/intel/xe_vm: Do not error on -ECANCELED"
Thread-Index: AQHah6vhgsi3lGKQ/UyX9IJh/EmRIrFhqNrQ
Date: Wed, 10 Apr 2024 15:49:23 +0000
Message-ID: <CH0PR11MB54441E418B451E3E6882C72DE5062@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240405225215.226833-1-matthew.brost@intel.com>
In-Reply-To: <20240405225215.226833-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7354:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ytApeqrNhW+TmYMxwIKLm61TmvQoT724zUmNOfDiOx6a5UyzMCzNkmYsdkIg9qJTcl/yyo5g+YnkXkNxKRZE5soWTlmesj89MJJNhVKZN42/v/z327Uu80hiTsqhss9eQkehGxJZyK0PJiTFym2pjMkHXZMZAstgnUE/5DpHsAwX0E76AGnM5PscLbloCUCiZsHuL03OrUWSGlpXvT5kq0FdbB9FnpgM2mpQPoY70iysPOXq3YocjOXmAKtDL2SG/mYU6oIgILIraUHexUaf4R5do0wMxU7Y9B2MKLkS68o6kwyfNGVIDitYixpklKo78kQhwo00PjpzmHDuOWG7Q6AyLMQ84lzI5T6jFuuyPcYhLGc9lFOtDNnRvnR+00pA7NlshSSFb6K6Ay8lLJeqh0ieeZzzx1dVpSZ3B+DAtgXc8diJYDpEOTBUVYNIM3xZls3+mjB2tyBd+ezG2JepJmpzUG8CO2+rMlR99wUQlDl+7DA2VMfxXlTAYf3VOYLILTo0l8HWwprBQS0h7YzJ64vmHhbwfLSRl9b0f34b9lkvZ2MR+z722SgE9Px0K5G8pEcue2zcbWLvSfq+vNSHTva/qDOaAnkeTHHyu0rBYbQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?egJbtG2iB/gi5ALfzui5ckoLu55qj/+5GnujeXg2yjo1f3LsTPETs8oXQz/x?=
 =?us-ascii?Q?N6p5TDFEFL1Ilc/KNksfRknR+nLdvUly3FtjDfycQ1GJfFXY48krz2Yu8nif?=
 =?us-ascii?Q?5dczAC+3/3Oi/xl9eiP467IOWMwVmitPf0VFKFRNF5GDDyGJKoqw+gne8wVG?=
 =?us-ascii?Q?MHkzI5sfQi/+lICQDP7SR+HK6AVQzlHZ+PYAa2KofaiSiJwC6OwhS//lcqCS?=
 =?us-ascii?Q?F7mCVRBM+2DXO1PGhF3zBHxiD6G1xJv5hpunMCoaxDcZzgOStM6ksL5sjhqr?=
 =?us-ascii?Q?AE4wfVs+AaAe3Vg1n11ycAPqVOJxR16qWAIuNX0tbTiSWwBF5ugWJSJJWIhu?=
 =?us-ascii?Q?2swqNx6W9kMDS+ABAyVCg5cWLzb6/mSf7wbEDcB1TfxvTW9+1ObpQACHR2t/?=
 =?us-ascii?Q?onFAByl2Y/GdDSoOamsZ6V7/57QX1e8ItP6JCGKayDxK1owPLbwrYVc4c7MG?=
 =?us-ascii?Q?8YPRFl3BewlgquLEByNnYYVPKkLmPE9w0JqafcW1auEpL31CLzqKYdToiYOv?=
 =?us-ascii?Q?oySg6jErxQwVNwx/X3DCzsDqXH/uP0MX80/7MQE8AVmWo1hFgoYvCqX98fZi?=
 =?us-ascii?Q?p6D9z1243uczWxENWQ3fYaZoS7e1Qikk0MJze66IND8XBsNwijiVZFklN5zv?=
 =?us-ascii?Q?6buoelLTYiDACktiojXT1xeNAxrF8s6Zoh5H6YwQ/xeLBh7G2QmzcYDDaM5j?=
 =?us-ascii?Q?nxMdM/z1Ax7Mq98ZQ/eE/7RrT/scDhLUsZCHj4aLaeVnqtz9LVUhnS9Pi+dX?=
 =?us-ascii?Q?Seb9uaMJaQq4hYZ4tU99sMNijE96iA46Ihi3/je1dptzlo6zVhdfU10rZeDX?=
 =?us-ascii?Q?yPxgwHqmAazhO35736ps4xD3lRa2wshGobEBvOCWWYcaec4Xv5PUWynlVyHS?=
 =?us-ascii?Q?vxvaZSzgC7gLGeal3o9f7pqqL7BeAg8lJGqVilaq+kIMf8QowNtjZ/am+a31?=
 =?us-ascii?Q?zNUXdH04+Cy5hRUAJu4iFDBnw1TkkOjHlBexipqy+sHZwXgF1hcAfaGdEDyr?=
 =?us-ascii?Q?1Xu7bS3G19aM7oDrtmLjO4q21tbaJdy+dN4hHkn2aFX7FVZUTiehh3BzRrYm?=
 =?us-ascii?Q?gx3u+PmBbSeZ5WiI21NdQBU3LYw+J45CBrLKO+NmjJbopD5a3eMRwUM25MwM?=
 =?us-ascii?Q?+oA+tjwAb+NxBCmEQ0Q+ziTOdt2S47y9lCHPKUgQAOkfIyq9W63G+8VHChYl?=
 =?us-ascii?Q?FnF0M3TNV4zqqgkTRZjg01QDP7N8k60OeR1W2xnIGIApDrm1auq24dlgNxtc?=
 =?us-ascii?Q?pRvAGR+FciSmqmb3d+pggHBau4w66B2M53x7p5ja9WL7Wg2OmrzUSoZ7bNhY?=
 =?us-ascii?Q?9iQlFJQZJ7yWVLmQZTIHgXegg+0U8hKnZ8MJ7L35kvB1Yv6XOgf2uEoiHT5J?=
 =?us-ascii?Q?GPtKO9+ouz/yd2NhVoRx+p6a/TrkpwRQZe3BYKsAaKcVmpqUkTDHYNTogFs5?=
 =?us-ascii?Q?8SmgbVgDHnfBnPihQkSKoBsDfZt2eu8mJPbnMpSatOPTGnGUn3+gOq8S8So0?=
 =?us-ascii?Q?N3U9+QXrYUGwSTM8f99qSTVN3fLhbRdqmy/kOyfuotx7TDk/kvRyOaBlhlD0?=
 =?us-ascii?Q?gWwA9ZZ8wuLrrFLJb20SKMeCLsEuRgurf+J3kRq4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9205572-9025-47ea-2661-08dc5975cb6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 15:49:23.8350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcFoQ5bjZZZmPE7rQEfARJeWat+LhTvwDcrSQawY7WVzpEdB1iUEyRQykB27SS2VFW1XMohONUHiIIspKynkA2IS2BvIvh2EU4ZkvVvfEv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7354
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Friday, April 5, 2024 3:52 PM
To: igt-dev@lists.freedesktop.org
Cc: Brost, Matthew <matthew.brost@intel.com>; Cavitt, Jonathan <jonathan.ca=
vitt@intel.com>
Subject: [PATCH] Revert "tests/intel/xe_vm: Do not error on -ECANCELED"
>=20
> The test should never unbind an address used by hammer thread nor should
> the exec queue in the hammer thread get banned.
>=20
> This reverts commit 81462e71323ae6764d7f509f4a1bbd3e41aab13e.
>=20
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
You also proposed an alternative solution that I verified to work
(https://patchwork.freedesktop.org/patch/588571/?series=3D132238&rev=3D2)
Perhaps this revert and the new patch can be posted together as part of the
same series?
-Jonathan Cavitt

> ---
>  tests/intel/xe_vm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index ecb2a783c4..bd4973cc38 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1126,7 +1126,6 @@ static void *hammer_thread(void *tdata)
>  	uint32_t exec_queue =3D xe_exec_queue_create(t->fd, t->vm, t->eci, 0);
>  	int b;
>  	int i =3D 0;
> -	int err =3D 0;
> =20
>  	sync[0].handle =3D syncobj_create(t->fd, 0);
>  	pthread_barrier_wait(t->barrier);
> @@ -1149,15 +1148,14 @@ static void *hammer_thread(void *tdata)
>  		exec.address =3D batch_addr;
>  		if (i % 32) {
>  			exec.num_syncs =3D 0;
> -			err =3D __xe_exec(t->fd, &exec);
> +			xe_exec(t->fd, &exec);
>  		} else {
>  			exec.num_syncs =3D 1;
> -			err =3D __xe_exec(t->fd, &exec);
> +			xe_exec(t->fd, &exec);
>  			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
>  						INT64_MAX, 0, NULL));
>  			syncobj_reset(t->fd, &sync[0].handle, 1);
>  		}
> -		igt_assert(!err || err =3D=3D -ECANCELED);
>  		++i;
>  	}
> =20
> --=20
> 2.34.1
>=20
>=20
