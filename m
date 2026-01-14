Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3798CD31A0E
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD45C10E147;
	Wed, 14 Jan 2026 06:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcvgPkcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EEE10E147
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768372326; x=1799908326;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JzZl3mL5UMzj3QQHn8Yu92ly3u9L3CWNEnM8iQ92yNA=;
 b=WcvgPkcVx7tO0Nu5nQBBXrsym2jF1WSqDKmHtefwrtRc8Oz8rT/BOBzj
 7oYSKT8TzetVM8Zjiuchxxw6TVus57xZxt73LujfwqlhhtVqu5naFmlly
 NNCHcUocAgeXzgZsvp+iYdaMMeYctGSFp0BSchMTHfwEE6pxLDv/9Vl4M
 XRYSJifZ6cdY5LRlr3MtQ8PR67o3Wo2HfFgfwSNpk2NAykmYJDL5R1BV4
 uWwkIkT9xINIWkCIXHIGYOYoIwJ0eTPsuXyPjOu70Fplu3aNlL7pg6cCc
 woIM9CKo9OrK+1hstnFeBtGZ+zs2G/Rg2hkydlvA5tY1o2baF6g6Bv6+Z g==;
X-CSE-ConnectionGUID: jH6AEOwCRx6CGQmnn3oJoQ==
X-CSE-MsgGUID: GFF7UzB2RAu2+xLiQ0zcdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80777061"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="80777061"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:32:06 -0800
X-CSE-ConnectionGUID: OZBtXOtnTXu1N2NSIjsGFw==
X-CSE-MsgGUID: eP367PmQTZOlenb/tjWKMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="203811831"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:32:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:32:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 22:32:05 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:32:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xi4qo5d1GMH6k0eNN5ePHAegoKVequQPhOnzlPiX/IeHoXGthFCjY9ISXdKlJUI1BJ3t8Fcn9oMD2LCiJPccM4fAI3cQviIWQQOIc3m8x3uOll5RJpjsZraISmWoXPkKc8DW0cXjHlWbHlmL27n2NwzEa3nhFnryyJH03prRoZsAs4cfubn6xiuJcakl0WifZCdCEdvBBBhfNlvVHYFbotabDjEYaaEFwvKbDim5nXyPYsCGlKVW8Dd1xeSQIMnuNW/CaC7SrVx9RjRIi7OclcwwFSClqMXK4OwIJd+Szg94C8rRgKHrDCWxtnRs0JrfK7seyNO1Si+b24i3+Q22Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2F32T4NfeSLHeSYf1BHaIorX6RY7RV+J0EMg0XG+/LQ=;
 b=bGCN2+dkqCTvIaZ2K+4dQyXxc6p4jH619/ZpioZ9gBXPzxHKhshp37e1v97X74QLMBVeUZA8VW/X3CWiPjdJFPzX+xI+geg//7t8z4yD+BjCGytVRWzl54uhWob1DCJbJL5OEufuBtg4C40H/Y4K1g7Tt+4stmXykhU0h42wEpHcxDGF8te/s22w7FJD+sNqTC3+tKTYoEstZ0YM1yVbJfwiy40FafAHmISERvfuQyKm7DJa+gigmLKh34YBg9xj+kM10Oanfrj50PziXvzR7l4UvlJJQn9p2T74amr2oSLz2oVWlDyyZ2CUk1xbA74TlAtL+sZwQl8WOFl9EtZ4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 06:32:03 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 06:32:03 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 4/7] tests/intel/xe_evict: Enhance testing of multi
 queue functionality
Thread-Topic: [PATCH i-g-t 4/7] tests/intel/xe_evict: Enhance testing of multi
 queue functionality
Thread-Index: AQHccN9kXHpqV+THzkeackHvKxvw5LU8iRUAgBTTfuA=
Date: Wed, 14 Jan 2026 06:32:03 +0000
Message-ID: <CH3PR11MB8434907C42468E2A39666AE68D8FA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-5-priyanka.dandamudi@intel.com>
 <aVW_clM1s2C1fy_2@nvishwa1-desk>
In-Reply-To: <aVW_clM1s2C1fy_2@nvishwa1-desk>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA1PR11MB7199:EE_
x-ms-office365-filtering-correlation-id: abd90336-8599-463e-d662-08de5336a177
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?V/tRwwxieOQSvk5BuEqptgknqkkuthh+TSWLKIwghgWPWU7TMBnLdaPEnbKc?=
 =?us-ascii?Q?mCLwyrBcLs5k86iQxl6e9gKeEkVo+p4Rd/kXClpK93x2cvVFCIy4Qtpu95Xb?=
 =?us-ascii?Q?8bHDvQCzbt8of1U6eBKOrOv0/OM9OW0Pyag1uxY0YM10LNUoaXZWZui4darS?=
 =?us-ascii?Q?TcsbAoLFmESZLhqwB/FVqI5Y169VOmc2MSCAC227ucFpvkDtV2HEHZ3r30aB?=
 =?us-ascii?Q?HEV6o6Hsv46pv454h1be7Iu64erWwRHbC9p/cAHxTrsQr1FdayoYMgsF2dKc?=
 =?us-ascii?Q?mjg3e3n05KEJJq2PmI/JWVG58IfFi6BMl9mbvWMmIBaHPtc0S5QHQPhUDyrj?=
 =?us-ascii?Q?A+1M8Gw87AtXAtkig6Y6Lvv0N47zO4p0Di9QWiKxQ6Z0EU42/8kyCijZo21n?=
 =?us-ascii?Q?4DGWKcvx1VczDMqms0LHv9ItZWXDsQQG7uAajOrJ27bhTn2PxcYDGnxNLc8t?=
 =?us-ascii?Q?Q5GLjQsuZDlqLIUMIfsbH3v84IGFgTx8W6p5WmOYnG36kZdfeGPmwe712J+p?=
 =?us-ascii?Q?wQNmt8klawDYPKYuwKIH7klXLNATxX3tNIz3737NhAuU3fonOvUoQf3Ao4oK?=
 =?us-ascii?Q?TwJhu1fqPBrDtmkk4Jn0s+7FdoW2mz+ZzNrvqQuJGXFvyCFEhK6TItm7+W6x?=
 =?us-ascii?Q?vX4o9b+BJlU1WK1ZhCwjJj6HNu8iJz0tso7A5U8bWH4i7kd3RKnz1E2CqlB4?=
 =?us-ascii?Q?I66z1UboTYVjSwmYiQC7T/dCHtfhV8qxhobkOOeDWd5DNj5XLoN/0fl32S//?=
 =?us-ascii?Q?+TVX0/L7sLVEbjmRckt7DlGDIs2Pqc/0hdTWUrL65wG4DvmTKBC7n1+ESFLG?=
 =?us-ascii?Q?DsBFQqlFcEkoGDiPiBxUJchrIHnaL4QivYixIJelDveW6iIOxU8ZjjCXP+jV?=
 =?us-ascii?Q?eHAt1XudkYQEyLkoJqP3Xg05l8BCkEvKcr104hGvvph/PbRBsXlWXpijtj5T?=
 =?us-ascii?Q?9JWQRSWqxeWINfKUf1WCxrBv5vTvGGuSVWj9nA691U6BqovNNLqitvPFlMix?=
 =?us-ascii?Q?dXYEoyvnvc3GKBeYXfdiYFMGRV5crczIVuq7eqJnj1Dn9DwR9zpOc0gvVCiz?=
 =?us-ascii?Q?8WBv4Il87LvJD6hfdoikpzqrQr5TSKeInPex8pMXkY285BX0TlD9QRZZWEhO?=
 =?us-ascii?Q?XGhrXD2qZEYaIOf7HTX+4zKyBrh2D4HvBozGlZZQWmaRBbRbtco+N2DASWHT?=
 =?us-ascii?Q?y7GmcT+Yk0Voody3z1s51nmedP3Ad7yUhjy9LPhZ4DVt1atpk+bDtFoDBXFs?=
 =?us-ascii?Q?Gk9JIPCOymUgpOybm4TEh+Hh/t6yHD0S65H137iTCWYVkzMaJzwg96nsZ0rj?=
 =?us-ascii?Q?HOMs1c7IeWyKWA0p4HaiAEYXYGf0q7GaJfOII4LVAhkzIhGGpiSYRffPUF/X?=
 =?us-ascii?Q?xtNyckrsZy0PRdTBasRq+mD/kyuCm0lHDfedMAV6DMkIJzn56X15vv0s0gvr?=
 =?us-ascii?Q?4ZaNYEKkWeyTXIzKBuAnnxBli4ctRn4AagKLBWaeh0RKcNLd9T+M4VdzVeyR?=
 =?us-ascii?Q?Eeb4X5Km5jVyL+UcZX6Q394MQp0L8ErHDh8c?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+9MEDmZqSN4TKfXTYeco4kuVFXosE1RQICh8G7MVcQRxeKM7UpPu2MDqIzIZ?=
 =?us-ascii?Q?9NZJnPoefaOic7FgnYNwT1hBEK9GrxIOCeWv1yDH0sS15iaFlJtu6lvBUuPm?=
 =?us-ascii?Q?kDKwcCBO3mztPVVB/64nRzZArvnUsl8Vw2pKwDkmRFupj32gTFUR/1+TNVtc?=
 =?us-ascii?Q?t4AD8HJavdsdWMQ/PmcC3/muYOjRmdNOR3jsfWWKFm07egGcKJlRWVcx5p33?=
 =?us-ascii?Q?ncjAXJvTTeY1vKZmDg2nXMVt7ExcapX+C/JsYj3cQvmScYGICGpqKiRXFNnh?=
 =?us-ascii?Q?NTGScA1ZaptqS+chCQAgwXT0XRVq/IgJE4cUp/iMilj1inKJHohTIbTaWRjw?=
 =?us-ascii?Q?8lw3HXfgXLhS7Kwj8Z1JHEksLO0IzoyVA5HjgCdQR4v7LohRlZVsyJr4ac6P?=
 =?us-ascii?Q?huBeNsN/OKsq4lmJ0HCzCI6NMSbw6aRv9RCFlU0jvp3miMrX0EUVSUjMNKIn?=
 =?us-ascii?Q?f1XyUZb9ivmbcB69qx/pb/nCOJ/Be2+61XFrmzob6kwt53LiKB1BUuM7SWIn?=
 =?us-ascii?Q?r2qxUm8w9sKm28BsBlZIVSWOjvzlQDrI43/yer+fltTECcN+/rjvEFP+pI++?=
 =?us-ascii?Q?VGt2RKgRdoupRmM7hFQGGkDm+fHo+g5nDjmZjWq+G/VbYJ9Gjrwiyu1LoiVU?=
 =?us-ascii?Q?XjtJI+JM18DaM8YkcxqbMNd/2iewWXNjL97Kpcs1/IDPl8cWMbqvx1qiEBJD?=
 =?us-ascii?Q?/9ZTzJMUeC+c+3BOQLT8wBuYRFdlppXvPwpJhvz9wfzViFYAms2xsRccQDT1?=
 =?us-ascii?Q?p3hgQhI9Czae7lzxpRfeMEPxsRb5BsQCQSk5FGpFdcMCOmOntjK0imQzeVrB?=
 =?us-ascii?Q?q3WOpXwzpvEq/8WXiIubnEAkXNI9hDnqQni6Td75+GbJGYKUNA5Oqc2Xcevy?=
 =?us-ascii?Q?Ln/gAfPhx5ZzSyZpInUUcIrVq3ckFcoafOn1JKObWXIsg8onyOp6l/QpYjYp?=
 =?us-ascii?Q?r5OdldZgFTKgObfV6o2pKNf5reyzdDSTqDc23iiSawboqvJuZO9+ppqjBKjR?=
 =?us-ascii?Q?fRZ527SUTZTNEplnUi2E9Bq2E45P18mvTnxtxO5+8XVXJlB8fEF1ytYm1BUJ?=
 =?us-ascii?Q?aq0rfrGDhqUe259HBD0o4djKik42PCOWb0SIRDsLNUuszsYH42PK+CC2/riW?=
 =?us-ascii?Q?I5/frNr3JBTRZkIymaAE6mdGtimGsVCmD+Ila4lAbGii+41//kNFi8fpzRNh?=
 =?us-ascii?Q?8KEwD4JNaJg7/ip/SzXnZGPo+4AS0UkeeTA3wovVBgBFKRgmqmS7savEm9da?=
 =?us-ascii?Q?21EjsVZGYvQm3eB4MsY3r7v+J/KrdklADMuXi3CndfIwQ4R2SiI6nZC7Yb9F?=
 =?us-ascii?Q?6ucXy1lK03n/MqiGDM4yE/RYKGV+Fr2Ztet5zeoMVnpeEKkex0Qy+wJLpZbC?=
 =?us-ascii?Q?qP9h2Q7vQVCl3OqmlqKQhhKh5rtnu4XmRe2QtiwSHKKUU2CC205+ap+BFX4f?=
 =?us-ascii?Q?8CJTuyTZ4UBTQlRIqtwef/HaWRHXMBqCqhNi7b0y82HpEB2eIRVa5pGKfzuD?=
 =?us-ascii?Q?EkkZaW1vzWdyuqaUZitsbdQxdo6avkdJYdXB1BIbyb8Uw7eeIEm2KeeQQcaq?=
 =?us-ascii?Q?DFbIlwbBPqoKRJ4A2KzAN5fr+eeFnxXeycHJf+z33CJkISW0cnqYs+lHFZRu?=
 =?us-ascii?Q?zU9qNPdM1xMka11BDkJ9u9Lq9K5dpQPb7ysy+Jz0WDwDeuedSGvfPIedo/IJ?=
 =?us-ascii?Q?Vy0BlYX4SDcXgbigQB9SLcH39XMttASxe6+7OYZCUvSFTnOVWP9j54m6i0bn?=
 =?us-ascii?Q?uClMUy05HtKwu623pWznWNWCZmIal6w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd90336-8599-463e-d662-08de5336a177
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 06:32:03.5384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /XK/ojZdQ5nHxKezcCTuICDYzm7fN3FLkONTdh34tN+OHC1hQX6irQ5NZAVIsxQ5O4isrlReloN7+f937VywfcDor28TjII2slLzU42gi5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 01 January 2026 05:58 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 4/7] tests/intel/xe_evict: Enhance testing of m=
ulti
> queue functionality
>=20
> On Fri, Dec 19, 2025 at 05:31:51PM +0530, priyanka.dandamudi@intel.com
> wrote:
> >From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> >Extend testing of multi queue functionality with flags like
> >EXTERNAL_OBJ, THREADED, MIXED_THREADS and COMPUTE_THREAD.
> >Rename multiq to multi queue across for better readability.
> >
> >Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >---
> > tests/intel/xe_evict.c | 159 ++++++++++++++++++++++++++++++-----------
> > 1 file changed, 119 insertions(+), 40 deletions(-)
> >
> >diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c index
> >35192aad0..26b6091a9 100644
> >--- a/tests/intel/xe_evict.c
> >+++ b/tests/intel/xe_evict.c
> >@@ -7,8 +7,7 @@
> >  * TEST: Check VMA eviction
> >  * Category: Core
> >  * Mega feature: General Core features
> >- * Sub-category: VMA
> >- * Functionality: eviction
> >+ * Sub-category: Memory management tests
> >  * GPU requirements: GPU needs to have dedicated VRAM  */
> >
> >@@ -84,12 +83,12 @@ test_evict(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 			exec_queues[i] =3D xe_exec_queue_create(fd, i & 1 ?
> vm2 : vm ,
> > 						      eci, 0);
> > 		else if (flags & MULTI_QUEUE) {
> >-			struct drm_xe_ext_set_property multiq =3D {
> >+			struct drm_xe_ext_set_property multi_queue =3D {
> > 				.base.next_extension =3D 0,
> > 				.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> > 				.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> > 			};
> >-			uint64_t ext =3D to_user_pointer(&multiq);
> >+			uint64_t ext =3D to_user_pointer(&multi_queue);
>=20
> Please don't make such name changes in a separate patch like this when it
> can be done in the first patch that introduced this.
>=20
> >
> > 			if (flags & PRIORITY) {
> > 				struct drm_xe_ext_set_property mq_priority
> =3D { @@ -97,10 +96,10 @@
> >test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> > 					.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> > 					.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> > 				};
> >-				multiq.base.next_extension =3D
> to_user_pointer(&mq_priority);
> >+				multi_queue.base.next_extension =3D
> to_user_pointer(&mq_priority);
> > 				mq_priority.value =3D
> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
> > 			}
> >-			multiq.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> >+			multi_queue.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> > 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1,
> eci,
> > 							     ext,
> &exec_queues[i]), 0);
> > 		} else
> >@@ -553,14 +552,13 @@ static unsigned int working_set(uint64_t
> >vram_size, uint64_t system_size,
> >
> > /**
> >  * SUBTEST: evict-%s
> >+ * Functionality: eviction
>=20
> I see many such changes in this patch that are not multi-queue specific.
> They should not be here. If you really want these changes, put them in a
> separate patch.
Will remove all the changes which are not  multi queue.
>=20
> >  * Description:  %arg[1] evict test.
> >  * Test category: functionality test
> >  *
> >  * arg[1]:
> >  *
> >  * @small:			small
> >- * @small-multiqueue:		small multi queue
> >- * @small-multiqueue-priority:	small multi queue priority
> >  * @small-external:		small external
> >  * @small-multi-vm:		small multi VM
> >  * @beng-small:			small bind exec_queue
> >@@ -569,6 +567,7 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> >  */
> > /**
> >  * SUBTEST: evict-%s
> >+ * Functionality: eviction
> >  * Description:  %arg[1] evict test.
> >  * Test category: stress test
> >  *
> >@@ -584,15 +583,13 @@ static unsigned int working_set(uint64_t
> >vram_size, uint64_t system_size,
> > /**
> >  *
> >  * SUBTEST: evict-%s
> >+ * Functionality: compute VM eviction
> >  * Description:  %arg[1] evict test.
> >- * Feature: compute machine
> >  * Test category: functionality test
> >  *
> >  * arg[1]:
> >  *
> >  * @small-cm:			small compute machine
> >- * @small-multiqueue-cm:	small multi queue compute machine
> >- * @small-multiqueue-priority-cm:	small multi queue priority compute
> machine
> >  * @small-external-cm:		small external compute machine
> >  * @small-multi-vm-cm:		small multi VM compute machine
> >  * @beng-small-cm:		small bind exec_queue compute machine
> >@@ -601,8 +598,8 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> >  */
> > /**
> >  * SUBTEST: evict-%s
> >+ * Functionality: compute VM eviction
> >  * Description:  %arg[1] evict test.
> >- * Feature: compute machine
> >  * Test category: stress test
> >  *
> >  * arg[1]:
> >@@ -617,27 +614,8 @@ static unsigned int working_set(uint64_t
> >vram_size, uint64_t system_size,
> > /**
> >  *
> >  * SUBTEST: evict-%s
> >+ * Functionality: mixed threads eviction
> >  * Description:  %arg[1] evict test.
> >- * Feature: mixted threads
> >- * Test category: functionality test
> >- *
> >- * arg[1]:
> >- *
> >- * @mixed-threads-small:	mixed threads small
> >- * @mixed-many-threads-small:	mixed many threads small
> >- * @mixed-threads-small-multi-vm:
> >- * 				mixed threads small multi vm
> >- * @beng-mixed-threads-small:	bind exec_queue mixed threads small
> >- * @beng-mixed-many-threads-small:
> >- *				bind exec_queue mixed many threads small
> >- * @beng-mixed-threads-small-multi-vm:
> >- *				bind exec_queue mixed threads small multi
> vm
> >- */
> >-/**
> >- *
> >- * SUBTEST: evict-%s
> >- * Description:  %arg[1] evict test.
> >- * Feature: mixted threads
> >  * Test category: stress test
> >  *
> >  * arg[1]:
> >@@ -655,8 +633,8 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> > /**
> >  *
> >  * SUBTEST: evict-%s
> >+ * Functionality: compute mode threads eviction
> >  * Description:  %arg[1] evict test.
> >- * Feature: compute mode threads
> >  * Test category: functionality test
> >  *
> >  * arg[1]:
> >@@ -669,8 +647,8 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> > /**
> >  *
> >  * SUBTEST: evict-%s
> >+ * Functionality: compute mode threads eviction
> >  * Description:  %arg[1] evict test.
> >- * Feature: compute mode threads
> >  * Test category: stress test
> >  *
> >  * arg[1]:
> >@@ -680,11 +658,31 @@ static unsigned int working_set(uint64_t
> >vram_size, uint64_t system_size,
> >  * @beng-cm-threads-large-multi-vm:
> >  *				bind exec_queue compute mode threads
> large multi vm
> >  */
> >+
> > /**
> >  *
> >  * SUBTEST: evict-%s
> >+ * Functionality: mixted threads eviction
> >+ * Description:  %arg[1] evict test.
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @mixed-threads-small:       mixed threads small
> >+ * @mixed-many-threads-small:  mixed many threads small
> >+ * @mixed-threads-small-multi-vm:
> >+ *                             mixed threads small multi vm
> >+ * @beng-mixed-threads-small:  bind exec_queue mixed threads small
> >+ * @beng-mixed-many-threads-small:
> >+ *                             bind exec_queue mixed many threads small
> >+ * @beng-mixed-threads-small-multi-vm:
> >+ *                             bind exec_queue mixed threads small mult=
i vm
> >+*/
> >+/**
> >+ *
> >+ * SUBTEST: evict-%s
> >+ * Functionality: threads eviction
> >  * Description:  %arg[1] evict test.
> >- * Feature: threads
> >  * Test category: functionality test
> >  *
> >  * arg[1]:
> >@@ -699,8 +697,8 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> > /**
> >  *
> >  * SUBTEST: evict-%s
> >+ * Functionality: threads eviction
> >  * Description:  %arg[1] evict test.
> >- * Feature: threads
> >  * Test category: stress test
> >  *
> >  * arg[1]:
> >@@ -712,6 +710,79 @@ static unsigned int working_set(uint64_t vram_size,
> uint64_t system_size,
> >  * @beng-threads-large:		bind exec_queue threads large
> >  *
> >  */
> >+/**
> >+ *
> >+ * SUBTEST: evict-%s
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Functionality: threads eviction
> >+ * Description:  %arg[1] evict test.
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @threads-small-multi-queue:	threads small multi queue
> >+ *
> >+ */
> >+/**
> >+ *
> >+ * SUBTEST: evict-%s
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Functionality: compute mode threads eviction
> >+ * Description:  %arg[1] evict test.
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ * @cm-threads-small-multi-queue:
> >+ * 				compute mode threads small multi queue
> >+ */
> >+/**
> >+ * SUBTEST: evict-%s
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Functionality: eviction
> >+ * Description:  %arg[1] evict test.
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @small-multi-queue:		small multi queue
> >+ * @small-multi-queue-priority:
> >+ * 				small multi queue priority
> >+ * @small-external-multi-queue: small external multi queue  */
> >+/**
> >+ *
> >+ * SUBTEST: evict-%s
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Functionality: mixed threads eviction
> >+ * Description:  %arg[1] evict test.
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @mixed-threads-small-multi-queue:
> >+ * 				mixed threads small multi queue
> >+ */
> >+/**
> >+ *
> >+ * SUBTEST: evict-%s
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Functionality: compute VM eviction
> >+ * Description:  %arg[1] evict test.
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @small-multi-queue-cm:	small multi queue compute machine
> >+ * @small-multi-queue-priority-cm:
> >+ * 				small multi queue priority compute machine
> >+ * @small-external-multi-queue-cm:
> >+ * 				small external compute machine multi queue
> >+ */
>=20
> Can we have one header for all these tests like 'SUBTEST: evict-%s-multi-
> queue'?
> Or something similar?
>=20
> Niranjana
Added reply for this similar query in the patch 6.
>=20
> >
> > /*
> >  * Table driven test that attempts to cover all possible scenarios of
> >eviction @@ -735,9 +806,10 @@ int igt_main()
> > 		unsigned int flags;
> > 	} sections[] =3D {
> > 		{ "small", 16, 448, 1, 128, 0 },
> >-		{ "small-multiqueue", 16, 448, 1, 128, MULTI_QUEUE },
> >-		{ "small-multiqueue-priority", 16, 448, 1, 128, MULTI_QUEUE
> | PRIORITY},
> >+		{ "small-multi-queue", 16, 448, 1, 128, MULTI_QUEUE },
> >+		{ "small-multi-queue-priority", 16, 448, 1, 128, MULTI_QUEUE
> |
> >+PRIORITY },
> > 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
> >+		{ "small-external-multi-queue", 16, 448, 1, 128,
> EXTERNAL_OBJ |
> >+MULTI_QUEUE },
> > 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
> > 		{ "large", 4, 16, 1, 4, 0 },
> > 		{ "large-external", 4, 16, 1, 4, EXTERNAL_OBJ }, @@ -762,9
> +834,10
> >@@ int igt_main()
> > 		unsigned int flags;
> > 	} sections_cm[] =3D {
> > 		{ "small-cm", 16, 448, 1, 128, 0 },
> >-		{ "small-multiqueue-cm", 16, 448, 1, 128, MULTI_QUEUE },
> >-		{ "small-multiqueue-priority-cm", 16, 448, 1, 128,
> MULTI_QUEUE | PRIORITY},
> >+		{ "small-multi-queue-cm", 16, 448, 1, 128, MULTI_QUEUE },
> >+		{ "small-multi-queue-priority-cm", 16, 448, 1, 128,
> MULTI_QUEUE |
> >+PRIORITY },
> > 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
> >+		{ "small-external-multi-queue-cm", 16, 448, 1, 128,
> EXTERNAL_OBJ |
> >+MULTI_QUEUE },
> > 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
> > 		{ "large-cm", 4, 16, 1, 4, 0 },
> > 		{ "large-external-cm", 4, 16, 1, 4, EXTERNAL_OBJ }, @@ -
> 792,10
> >+865,16 @@ int igt_main()
> > 	} sections_threads[] =3D {
> > 		{ "threads-small", 2, 16, 128, 1, 128,
> > 			THREADED },
> >+		{ "threads-small-multi-queue", 2, 16, 128, 1, 128,
> >+			THREADED | MULTI_QUEUE },
> > 		{ "cm-threads-small", 2, 16, 128, 1, 128,
> > 			COMPUTE_THREAD | THREADED },
> >+		{ "cm-threads-small-multi-queue", 2, 16, 128, 1, 128,
> >+			COMPUTE_THREAD | THREADED | MULTI_QUEUE },
> > 		{ "mixed-threads-small", 2, 16, 128, 1, 128,
> > 			MIXED_THREADS | THREADED },
> >+		{ "mixed-threads-small-multi-queue", 2, 16, 128, 1, 128,
> >+			MIXED_THREADS | THREADED | MULTI_QUEUE },
> > 		{ "mixed-many-threads-small", 3, 16, 128, 1, 128,
> > 			THREADED },
> > 		{ "threads-large", 2, 2, 16, 3, 32,
> >--
> >2.43.0
> >
