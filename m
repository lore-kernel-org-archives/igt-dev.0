Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B39FC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jul 2024 05:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF0210E0A6;
	Tue, 16 Jul 2024 05:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6jhzYiL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F8410E0A6
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jul 2024 05:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721109577; x=1752645577;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XipqHqgfhz7a8jSgjPRQX8UH/RyIRC0el4b24Emc8RY=;
 b=n6jhzYiL6/uRHD9p8C0abvhNJPO8SsDByFbH1LBMZlwCzNB3cCrkMS7s
 MeeXsOWFo84WkVVahk4biFWSE/cW+VcLFbsE4W0jImElneL+RIoHqBXDL
 zJLpeTQYkvvxt85Sb6Dkgh/z/jx9SWOz7MIsHt0x9tXIAEZNYbo/eoZWu
 tjJQTRCeDy8q+kiQGWjGcH87MTkbSCI6Fs2u0y4ubBGejLnK8TemUExmW
 Lejshezn/HPLXj7VrSpnpEFN0hQr8UxYxL1nCgchW3iJvsr0MQ4x/FSSt
 YdIMs3M3JQfl80z6ZALBrr/ziKcdbxlyWLnh2/SrwS8zg6UGRfZjKEwZ9 w==;
X-CSE-ConnectionGUID: pINLfPYdSWOlVb6pyEmyrg==
X-CSE-MsgGUID: +KGyCGuIRi6UB2cQO0oyeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="36061846"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="36061846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 22:59:36 -0700
X-CSE-ConnectionGUID: d1+1KsPkSmiPmwyNs3+QEg==
X-CSE-MsgGUID: /hFkhEV/QtCSqE3uxrQjtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49818834"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 22:59:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 22:59:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 22:59:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 22:59:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vN1vO1Sj6Pmcg8Gc8TuKwJz+EKjC+iBStZRI1sYNkwF2vIk7iVW9oP/m7woDqgvmdXko9TqjiAvvPhm1jCMwgKGUz8WdSOnrYIj7U+QDICn9XRZESEaU6I4GwubyLK7Vw0uvzPnsgkld0qS2v1z5AVxZtRc+IpCnAVQjohGnjHI+Gl2dphMtqeJmWkiO20WyjrDPQGTtVPrBQyL+cYFhiCIF3FJN3O0zAFYxVuPlVA8h0LOGUpFcWuwzj70pk5yuc3wjX4iH1J7g3tgT5A71Gbd3Dux7oDA6LboMerpuPQ0lUFBpK41AvfXx6/qmBAIJQEY2vQEeD/cGjDC+eQNQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNiJXYdOKLzwJIVEqkzFViGHSUC806WvNUNp2BrxBl0=;
 b=qqmMLP98dfKYXxd5bK7LLqNfFAfY9ZpGQxuYYHcfAVSs4uZrAi4fYH4yLWVi6c3/O/O6o34qYEyZ20maAVQL5EK7Stfxhc9Vo+8TfgxU2ihHUX4iyKBFCDzSW4ildyfQef/bI3lZYhShnEklCz4WAu1Lqr+YngrB6KaBSVvX1nM2soVPIzEgYUFvNuiNdQuxPCQn0a9HGHeHnuWzMx/p2ZfOoF7En3ebauJvo/9adPNZAHPrPoDyJUefqet6hBNk1UBTDyTnjg2ScjC0PCeuaiOgfbLXdYwd8scLV7a5oyiqq9/gqE7VZlGe692lDwe/sKvHfCU8TLuoMgIHtQo4/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 05:59:32 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%3]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 05:59:32 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "akshatajahagirdar6@gmail.com" <akshatajahagirdar6@gmail.com>
Subject: RE: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Thread-Topic: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Thread-Index: AQHa0ycIuDHgNSqlekyCfpW/PmIV0rHzCE5wgAWddQCAAD118A==
Date: Tue, 16 Jul 2024 05:59:32 +0000
Message-ID: <IA1PR11MB6097392C8EF58980D5C1492786A22@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <cover.1720515376.git.akshata.jahagirdar@intel.com>
 <e597e39b0c22d3b58cda09e0e4b33f883b9140db.1720515376.git.akshata.jahagirdar@intel.com>
 <IA1PR11MB6097B86A91F51B54C414ADA486A62@IA1PR11MB6097.namprd11.prod.outlook.com>
 <CO1PR11MB4977801EB665615DD9A794568DA22@CO1PR11MB4977.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB4977801EB665615DD9A794568DA22@CO1PR11MB4977.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|PH8PR11MB6830:EE_
x-ms-office365-filtering-correlation-id: 3c628298-785d-4a74-60bb-08dca55c76c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?v4is1cf3oBvmTz4rLP8KPwmKh2zXGX6U52ii2uW+ykmFsKyR4Ri/ok5klHZb?=
 =?us-ascii?Q?/BJa2GmTLCuL8dYLp2Xl7yJS3TKi3Y1ET4lFgpxIZbAusc67IhDJt1RURodv?=
 =?us-ascii?Q?hEZMhvgh8tH83qrrcEnEFmNdj0JeA5w4S3OEHVQ0v2iOXdG5JgJZ/Dcgp4Sp?=
 =?us-ascii?Q?pqeUHONJ4WoUAhZRxdc/xQY6fPgF4kLR9/Ys+EW9ID2ybhwTRp2DRbIYlor4?=
 =?us-ascii?Q?DDemN8Y2lcDAxNfLmiz9KrTFAOKJHOo9XUt+2iT6RE4Li84xIhuK62SJdI+z?=
 =?us-ascii?Q?c/7WHwZQtianfKbX/cAsYwh4YlN7CIPk9EHNLuULohIHp4YQ74TsDPmgD0Qo?=
 =?us-ascii?Q?fZ9i7D38sYotCngadSFhjELI4tgCZ/+LNl6xRXLxBwlOtHvGYZ7GrNT16ciM?=
 =?us-ascii?Q?AfN03wXbiBv0tHZ9wwsG+kPR9nx58c9NxOLK0AoBCavsHra8PGQutbmmXIO6?=
 =?us-ascii?Q?cQWM+kHeKMhTHCMjOwUZ3r30FmBi7FS8EzZQAeR9VNgDCjdvrC7VbZs6ct1j?=
 =?us-ascii?Q?mhkb50XialPzzsuZXuLPTne9sL633Zn5y9CQyADj0wQk8n+xzbcLMNYN3Rb5?=
 =?us-ascii?Q?Hn3oYaLPT57unrR6ZjyIzMGKQIqnbi9GOt6VgwaKzHl2NEDl51aktkmSsbz7?=
 =?us-ascii?Q?SVDSLw2b+XoqOlO33CK2duR5z+/KUHpBY5M2JeOvbbRfBmZ12fVzd4nkohVq?=
 =?us-ascii?Q?xIpMeRRSFBQPhUDvo81oo5iaPvZp5/76WpZKVftxzSm7wZ6kgUHGSLeTd0Rd?=
 =?us-ascii?Q?RhvqgRnJ9f8sx2SFHj2mb8RaZaFpEkSu3aZTQdeIf6iyqeh31CHSDeaqFgOo?=
 =?us-ascii?Q?EMG0zdEIQ68jothQ6XJNk9KEqsN/AIiawVXM8CChPYRcHSc9tptwY134THTz?=
 =?us-ascii?Q?WDNCo8rup6pyyrj/eLXVO0DxccVFxE7FDGolmaYpGd7CRjUbCdHAteX2jR3r?=
 =?us-ascii?Q?j89CuBeflb95z+guxPkoMyJaXDdVsefz1ZOKHtbm3q7Ktjhx8wx+YuMZwWhy?=
 =?us-ascii?Q?fJDYjdsW4lgHk22Inq8Hl4Bnb4cOM3rghl0Py50nwZi2kh43EflHlcGpk/Vh?=
 =?us-ascii?Q?idcgDaWsZWTDB5iqthuh0rbnLfBitAhh0RMvENqas+1gDMx7igw0PcOfsDqq?=
 =?us-ascii?Q?c/qTpOZ/WqTL2Cek6DwpUCMuiyLYwBxnVH7e4yjFsczlE8jPr3v6NCvTysLg?=
 =?us-ascii?Q?UGol3OSRFzW8bXUf+vlpMdSAAp0sYazJIQq+zK5AYCXK04SD92Mt3rJaUY3a?=
 =?us-ascii?Q?pZjzuctYXpSnd54qc4NLXavrsYg9U5kpvy6H43dwm00d9fgPDN4Gs4VD9rQ+?=
 =?us-ascii?Q?k1zdTkrZpe6Km07/fCjync4Z1fNP0+YWCwpusleBc0Uh5Qx4bxCvPV6N56Yp?=
 =?us-ascii?Q?Q6nnR7NyrKn1zdTZdfuBUyz05+tWOvCiwWBW2JWnnKLK1xABzA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oYrY1hvUcA5/tQsNWo3RtmlblJS8sQ891p/n6y2z5Wp4Puhn6ASng1xSOxmU?=
 =?us-ascii?Q?mf/09YVRm1jxUdThNSYBm6th5Eh5dNDnb6xOfdYy3crQwyLjK2lDxMywecPk?=
 =?us-ascii?Q?gXeLzBHgHhGOsQzzYZiBbm+UnBUZH4PrbxUjPl/tocQ9OgT/jRBAR6b6Vyx+?=
 =?us-ascii?Q?SNoKcTFuf+fOmSWToRYlKei2Juw2Q0LFjCY/cILQMdn5YAoUKszy3Ii9QqNc?=
 =?us-ascii?Q?UgSM6X2SqJgGTZa9wrC45xLTfwqYrZVYHKUQo6G/82aStgcdxpjCELpc8EJS?=
 =?us-ascii?Q?WJ8cB/W6tEmV+AWuOoWx5af5d+T+1eLHS8B4jiPUtvFGGg1P13sRuORKrQc4?=
 =?us-ascii?Q?x8Bj5WRGRl2kzUdzUrwg87buRJHdvpL7LH0ugnqOrSgNH70M4cClLB5qZo7I?=
 =?us-ascii?Q?IPds7RsU9d5STxw3eRGExYYz+D8KYi7VYWvbLUhJxeU/r+Ldp2I9Jonmex8n?=
 =?us-ascii?Q?/k91ibN49jvKwSTvfrbOrq84XodOgMHY4Vc8gNHHjExTqf3fc3Gd792jqD48?=
 =?us-ascii?Q?gRCSI75sOMtRtEEesZEeBbpceazXnI1qITaSaJA7jYF/MJkoLrD7TUXq0pQQ?=
 =?us-ascii?Q?KaN3iJCA4LK1TGvOxyfaLzdBwrOefEBChGS94LrfSbPDIYPKeh6b0phpRpXU?=
 =?us-ascii?Q?rbJz1jLZv95tzdtEu9AdAobt3sCHg2kIpobnNfID1YZhumv2rnrToW9OJ/e7?=
 =?us-ascii?Q?ZKz0EQG2qB8VaUzewaYLUmhAOkIQAckL4GZ1HXfajY8trrInj3yhhSrruHGq?=
 =?us-ascii?Q?vqEuOd/Fn8n51vsnZyfdgUfq8z+gPDUPiKrboq0Vli/jhY5kjp7vtZykqVLY?=
 =?us-ascii?Q?Utn+uulAwZ2WHsLMREqy+971C9afytd2pWrIVFgGEXnxeQjVeB7iZyM3U/Bt?=
 =?us-ascii?Q?PUA2pB8OSuksAOJhXF3L1I5aL9ddSFwk4D1z6CTWEPKi8mejJ9oNBGE8x1X9?=
 =?us-ascii?Q?c8eoRfrs2OA/J8TIJj+hcKcJC/T+mt9gLdCDsLWj8XNScd8dbDKD/9OQz6j2?=
 =?us-ascii?Q?MvTqrbsX/9ih0sW30Fzh8zkgs3BW33MJ2RSnvTj07mDe3QsFsxwGTmOhAW5N?=
 =?us-ascii?Q?CD/9Trsvu3Q8h17S0iSNYW+CA3M4/R3uOnF6vXMpmP97kNElXc0n0dGTWrGK?=
 =?us-ascii?Q?0PA192M4II0AmGJbR9KN4v40tc7YLOwOn/XBqdeSFkC8u+BH8QLJESqiwZIZ?=
 =?us-ascii?Q?XP6mrBhqcFlAF77odHvldRoC6QFoOkHJbggerzf+54O+kQfzR6S7qfe59Rvs?=
 =?us-ascii?Q?KB2pp3yyYgmXNIixEhy+NvX3WAm+yvbNEES6XneH5UqvJtYE8ektZH9TKDeS?=
 =?us-ascii?Q?u1drTaxPfc26Ak1tbvl3z7YSZcj+o+vbVd6PO/MxiBdMYSR6BHo8bhbFO/SI?=
 =?us-ascii?Q?8lgSJ72AXYznHm8LPTCY2IyHBj6B/fJyFRp0S5WyJOAYAhO6p8UOGkZNTA/H?=
 =?us-ascii?Q?sonBUTKv5XHgPzKR1cbYE09YvNV0iFHGxedRuERr8ybFXa+SY8GQFCjlHLo+?=
 =?us-ascii?Q?T+dDjyCLgaiCL8GJYn0XyuziiDS7xh6sd4HOfX6gmoXEFdgcmnEWo71f3jTk?=
 =?us-ascii?Q?EaY6i0cdbTTXs6WmrMPiJjTK3e5F0x3L5JwULNrm3sUXfkn0/jlHnNLJWJF5?=
 =?us-ascii?Q?Ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c628298-785d-4a74-60bb-08dca55c76c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 05:59:32.7766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yScpgS5TexKC30y9a7yYpYcTid6axxL2FnH0c3HKHAsINI4s0Cw6aof9OCLl4okrKdy/5mrAc6Ok8mZdLX1rrjb0Y0TdMZMQfj4b2pFmLBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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

Hello Akshata,

It is something that was noticed only in patchwork. It is not observed in r=
egular CI execution.
So please look closer in you series before sending for review.

Kasia

-----Original Message-----
From: Jahagirdar, Akshata <akshata.jahagirdar@intel.com>=20
Sent: Tuesday, July 16, 2024 4:16 AM
To: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; igt-dev@lists.f=
reedesktop.org
Cc: akshatajahagirdar6@gmail.com
Subject: RE: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgf=
x

Hello Kasia,

This patch is actually meant for the intel-xe and not the igt-dev patchwork=
. Due to some unknown reasons, my emails are not getting through to the int=
el-xe mailing list. I sent it to the igt-dev list as a test patch to confir=
m if the issue is solely with the intel-xe list or with igt-dev as well.

I am still trying to understand why this might be happening and apologize f=
or any inconvenience caused.

Could you please let me know if these failures are solely due to my patch, =
or are they also being reported on the latest kernel or other patches? If i=
t's only due to my patch, we can safely ignore it.

Let me know if further debugging is needed.

Thank you.
Best,
Akshata Jahagirdar


-----Original Message-----
From: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>
Sent: Friday, July 12, 2024 5:33 AM
To: Jahagirdar, Akshata <akshata.jahagirdar@intel.com>; igt-dev@lists.freed=
esktop.org
Cc: akshatajahagirdar6@gmail.com; Jahagirdar, Akshata <akshata.jahagirdar@i=
ntel.com>
Subject: RE: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgf=
x

Hello,

Ashata, please verify results from patchwork as our infrastructure is not a=
ble to process whole logs.
Example - https://gfx-ci.igk.intel.com/cibuglog-ng/testresult/1840022997?qu=
ery_key=3D5010e5e29d437861d2c89e0d98eda884b16111d8
Looks like whole memory dumped to dmesg?

Please check your series before sending at least on 1 machine to avoid such=
 situations. Patchwork cannot be a way to test your code.

Thanks!
Kasia


-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Akshata =
Jahagirdar
Sent: Thursday, July 11, 2024 2:22 PM
To: igt-dev@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com; Jahagirdar, Akshata <akshata.jahagirdar@i=
ntel.com>
Subject: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx

For Xe2 dGPU, we clear the bo by modifying the VRAM using an uncompressed p=
at index which then indirectly updates the compression status as uncompress=
ed i.e zeroed CCS.
So xe_migrate_clear() should be updated for BMG to not emit CCS surf copy c=
ommands.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h  | 5 +++++  drivers/gpu/drm/xe/xe_migrate.c=
 | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.=
h index 0a2a3e7fd402..c3093506c28c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -144,6 +144,11 @@ static inline bool xe_device_has_flat_ccs(struct xe_de=
vice *xe)
 	return xe->info.has_flat_ccs;
 }
=20
+static inline bool xe_device_needs_ccs_emit(struct xe_device *xe) {
+	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >=3D 20 &&=20
+IS_DGFX(xe)); }
+
 static inline bool xe_device_has_sriov(struct xe_device *xe)  {
 	return xe->info.has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrat=
e.c index fa23a7e7ec43..2fc2cf375b1e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -420,7 +420,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile=
)
 		return ERR_PTR(err);
=20
 	if (IS_DGFX(xe)) {
-		if (xe_device_has_flat_ccs(xe))
+		if (xe_device_needs_ccs_emit(xe))
 			/* min chunk size corresponds to 4K of CCS Metadata */
 			m->min_chunk_size =3D SZ_4K * SZ_64K /
 				xe_device_ccs_bytes(xe, SZ_64K);
@@ -1034,7 +1034,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate =
*m,
 					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
 					avail_pts);
=20
-		if (xe_device_has_flat_ccs(xe))
+		if (xe_device_needs_ccs_emit(xe))
 			batch_size +=3D EMIT_COPY_CCS_DW;
=20
 		/* Clear commands */
@@ -1062,7 +1062,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate =
*m,
 		if (!clear_system_ccs)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
=20
-		if (xe_device_has_flat_ccs(xe)) {
+		if (xe_device_needs_ccs_emit(xe)) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags =3D MI_FLUSH_DW_CCS;
--
2.34.1

