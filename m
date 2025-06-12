Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11800C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 16:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC93A10E033;
	Thu, 12 Jun 2025 16:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwP5w3h2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997A610E033
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 16:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749746979; x=1781282979;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZsUvjdktzHW9cawUCm65sR/kz5/a6wPJfU6n9SGa07g=;
 b=VwP5w3h22cjxIPRgWOx/7fP+IVsHGIJcB0ZNVfitfudp0rHTEF7rMyyM
 dc+Fy+MZTDfV4eUhygJ+u4sWCrRSeHbjQedioyd8rTj+sOu20KOFOersD
 z8CPD0DGJPKDrI4i3rhiDpUW03c2GmHXXaUYXpzj/k/2RMvPBtWoZkZdP
 qnN7/Rvd8XhX+Sb1pF0g/QJElGIJ4eKFq4zKQHjMuEOUFZp5mA/oj9+AI
 OKnf4Ihs0dQQiBYn7FE2UtCGnkU69SjbxdNB8TLnXhJpHyqaQREYn8vjo
 vs2sAAeIVaDVf85dpyTnQ8QRxfFRX82IthoZdyFmE9aZo5bmb81abV9jY g==;
X-CSE-ConnectionGUID: anXMBkgTRmeGrrSDilH1ew==
X-CSE-MsgGUID: jAq1zfGEQnq02JtP6GMOwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52086905"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="52086905"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 09:49:39 -0700
X-CSE-ConnectionGUID: gWFX04ydTtKhTKwwxuC4tQ==
X-CSE-MsgGUID: MVlJFPFAQKGpavAs5dbjRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147418925"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 09:49:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 09:49:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 09:49:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 09:49:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGXuUXlcrwTRhSUBo0nORQj7C1Lk+IWZlJ44aIVdShS1eACAmIWWlYXZSWS63fJ5KJe2bwVgS9xvqFt8x1C/h5Y7AfHAuR4cL0NSxKYlyjg19kEOpJFWyal+xlZ26eGR5tyoOpq2V4VjJBY7EXO5FvDDNonYDqwBN2EKz+UkEWdc5E8c5exoszdmAZaEiwfIoOA0sRzv5C9wppiwT68xeuf1U/HZ8a8Ym2jbF2mbZ+BL/Z0ZQkm9faWtr9FPKTTG7xdN0sEAkZoo85sC8+rnftufx4DeiwypZhBywwFfy63+UVacCnbOdPTQGqKNP0FXGuXhEh+OgaR978LSBkSSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/lWrTnh1MJkFWRX0o0M7aorzJPy7EK502gtfxgKWH0=;
 b=R1HqQ2zvB0g6n6Lg11C/i7EX8MDugRuBxfzxJ9kEIvwwBkdoFBztxArCczc2hsbTK9cbpcphbD+DWrANvq3cql0j36b24HqFRW17Ub2F1iEPENKYWkXHe4KltqkaOY6SuKIOzwuOGNaBdo4mcfDopdNlSncNaqdzgvCrSCnGkCPW5U6EXtOzeB/hoJ/xWYyP/qwYPaQFTsNJ1DZLW8/N90bd6FY/z9D6E/GjhVmwnF7aWQRMB5zv62adwKb91gZBdCu1StOFlr6ynTWZkU85p8juUtSP8HKHwnQnHDEak2JhRwGyFLApqHttxA5kc3n3RAtBZYdRldRQacBx+uii/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Thu, 12 Jun
 2025 16:49:31 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 16:49:31 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Thread-Topic: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Thread-Index: AQHb22/hCXX+z8nLl0CwT5ZzBqu/grP/jCaggAAtsgCAAAFtkA==
Date: Thu, 12 Jun 2025 16:49:31 +0000
Message-ID: <CH0PR11MB5444B80E7AC333E8C9944B90E574A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250612081524.26153-1-satyanarayana.k.v.p@intel.com>
 <CH0PR11MB5444419E64DD6CDC14D13ABAE574A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <DS0PR11MB86868FA7D9CBD35DF0371430F974A@DS0PR11MB8686.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB86868FA7D9CBD35DF0371430F974A@DS0PR11MB8686.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5141:EE_
x-ms-office365-filtering-correlation-id: d7e743f8-9743-42ea-c1bd-08dda9d11a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0L4FE2Un4JoiiT3nPxAX3pQd0UMx+G6M3WDySWQlgG47CB4ZPBUA/jC2oKzD?=
 =?us-ascii?Q?znjcGp3e3LwHPrPUQubEs2hWrDn50TwGjBS6UWsJ9l6taWAEGYtJOU3udZfC?=
 =?us-ascii?Q?oxsbz0UJgwPRxMVWy+L1A2PwLMD2yBACb/uHztPip/C4eKgkRyLuxIcbsGY1?=
 =?us-ascii?Q?qc/6hxuCf0nd6MHQbL1IbgPSGNVo8IqJrfqT/dO0pzMXHDV6ADMQRKsHD4B2?=
 =?us-ascii?Q?3jYxbOk/lGIuBxUwsvxDeAIAX9nk9bgCPyVVGpjmftLCv+xbyYN2kRsa+YwQ?=
 =?us-ascii?Q?E8g6TQxfWYOuU51jO01tx2tSrOFVdcx9AfumEAiLF46Svhc0U61mZfr+x31a?=
 =?us-ascii?Q?4buf6acoMJ0uEqFItoYkFrrfzhx2BMkH46A3frpIOfbAZAKFC+cUDF9tBS3N?=
 =?us-ascii?Q?jWRFvkmZ9IK4RliPVTjkKZPrzwr1Uyyjc+huzsItHNtgkbi8cYQPamYehWnt?=
 =?us-ascii?Q?61jjqIRVMUIX1pwNsXIU0dPQ+sinSXDd/5unof+fDaUek5n2PpG9W+Fvcbec?=
 =?us-ascii?Q?0cLjQeNAnpAzGYx0cqlAo8mIPFdibOsEMMfLNSgE47lYWy54xQHeUhhkUOXk?=
 =?us-ascii?Q?4hY1lNrBQlbpSojMIWoTNof6OwpWC2ObI5nXTdnSkKyHP8lb6c08oWe92EjU?=
 =?us-ascii?Q?FugWuz6BVtivxL4xY8+7etMeF624RhyPCGzQLfzzxSNiUCQ71aQ3ChlbEEpl?=
 =?us-ascii?Q?U9dHm6keXUWmo9NhssoqR6AlbACi5DgSKYrSnVgvKuLOWBT6KlMEAmLSQm35?=
 =?us-ascii?Q?zgsbub9XhBAdxj2GDNab1gt0BTm4zITjLl1SouK1KK8uOG3y2hoXCrb45sq+?=
 =?us-ascii?Q?4/p8DkLdrZnX89kNEPCGSJTvWZic4nem/vh+YO/MhPhX/LhhYqwOUOEHaB5N?=
 =?us-ascii?Q?IOQ2ASPIcLEJEgWj8yxDovzQR4CNZghK6pHm44/3sS5KUISk2+do6LLMtJJf?=
 =?us-ascii?Q?mmeJ7BceMrtHFNMPlkJfFuq+6ncHotSxqDH+RfOR0tgDTuNVHuB/NJG0+bpj?=
 =?us-ascii?Q?8MSb7GUcdgPzwrva1S6oFJ/pPJ58a3jM5GkZAQOdQqF0Vlg2cNbiXCU7+l2Z?=
 =?us-ascii?Q?AydxTEmE4ZASFLiiuSvkknGtGIz4imvldb7Tca/ewL94K5ua+L5Jl8N6TsZt?=
 =?us-ascii?Q?VTtPXo6AOY/HWJNc6MQkG0oi60Jli9lF3Rd7Nhd8bOmu2ddD0AMlJa3udfry?=
 =?us-ascii?Q?5OoL6izvBrh4jOtzhq3TdTjnB2Qo2uIgO5nFVcsYZ/pT0mAD45GQtzTxISRy?=
 =?us-ascii?Q?YbLs8djRxECdpZSLhkuLugt25eB5xRye256dXX+q6ZnuKZ3WoKvMDj9jmS9U?=
 =?us-ascii?Q?9D19njES+l1Ya1gnZM8C7B+6SPik77p1ODkOvVAw0cT6acRW4RPNQgGSqr6+?=
 =?us-ascii?Q?tebK+hIAKP5vYM5VUVtOzKwJ7ygjst1TeBqthUs1NkZcAXzKCiQIyY0aRuPJ?=
 =?us-ascii?Q?XnYvbMgJoI8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aodYScnbtiOWrpeGTk8NZuVJqRYUBEcasK+8QUtrx5xsWTHEJjjSgzFwl4Dq?=
 =?us-ascii?Q?DV0RlEE/j41WjP6xK2P88thw+18S87nunfbrxG41nA5MQerUgNdvlBtXmHvj?=
 =?us-ascii?Q?GWigquNenc+KW8fmJJb4yEYdV5uhpO8Waj+SfBffBxJmc46y9bs8seVSWiVK?=
 =?us-ascii?Q?FrPjtQlLrhzP4R87Kl/E9gpR87eriQvAbh0aM6hzydPIDvFRnzB3vnPfKzcl?=
 =?us-ascii?Q?wtd64R/4fO+OSLwEzQO+3LDmE7zqcRWb5fnTHdsOl+L725rJTUUlxLWLn/g3?=
 =?us-ascii?Q?FjC37Jj1Vr54BMSeI+zKP+K9ST0h8oPlguhDSDVPCWkRVbaZXxxqAHEXdHu7?=
 =?us-ascii?Q?l2RdNRssFYMge/CcSY+PZB6LwYXzkeHhbSLg5ECbL8T3rEgf+yzHM7wPGRqs?=
 =?us-ascii?Q?bTbrKN1u2Ag0i3V6nJQaOpVxYP8KHOlHG+9ZSTtiBTGhoNiPDmyylrXQzLO2?=
 =?us-ascii?Q?Ihsuf3zJXPo9ENwngWtxQofjvK6yo0JT+5tAgF0vXsUv/KPwM+fUwrMuXI1b?=
 =?us-ascii?Q?ONIrBxG9kUZrm9/ztTOEBN2cPPZ4hHNo1/Z0xMgaaVbtOWc7nVE9nTFCY5Qq?=
 =?us-ascii?Q?pmClpEVHu2ddvrRUpWJpNL0fPHTSgJs5UOeFOHub1iAQqEPB9MpSqCG3WX+Y?=
 =?us-ascii?Q?f6q8Nmq+W2YT1jv4NGiR2qX3AvrcYtlCdRUrq+sjACuhH3eAijgJsxziXW22?=
 =?us-ascii?Q?1Ot+gsy1/3BAna9cdyB88QwBW6Lrrzi1cGX1BpgXMGQDPf10OyZufE4j89zU?=
 =?us-ascii?Q?rYPZCUwe2F0s/0bEw2t73SRQ+6dLDXSNanSpjHUNG9NXIUyNOYZYtBDalTPQ?=
 =?us-ascii?Q?0qM1Vr5ia87JneuvCp3lab+5h6DiPAk7NnAylUdnJmT3isKWjEnhEtQ1y20q?=
 =?us-ascii?Q?R+FbcP4JtCZ4qWuI1MoBF/agVn4l8rOyEqpWDgXH/pdf4tC0KRXJ6/i2GT+1?=
 =?us-ascii?Q?BV+on0p6GrPmNkFx0sq19Ga6pypUdgVvk4qMT1Cr0A0wL69KZfj/HtY9NQC2?=
 =?us-ascii?Q?FZ4q/mMQrjcW78Pd5kja5MhUVI5lt7kxrh5wS80VObQWOzAV57JeKhEe1XKS?=
 =?us-ascii?Q?PgSl7JP3TBxqU1M0cuV+DNu0UPz7+WxE4+95vS12o/5JBxw47ZTujBQSVPOK?=
 =?us-ascii?Q?ZLZXRgxNBrAy4bvf5ANuRQUM1PbMSC7cyCseo5G4XZsyHEx+IFo3fy8DFZXG?=
 =?us-ascii?Q?Kftlo57ecpPvqZt1+TZop97Tfp4U3JSrkxWydUsrKdhKcUPhmkMyou7EnxrM?=
 =?us-ascii?Q?iWzPXgxo6mLdHCkXa3JyJa6GQH+Et179wiytSeF+B5mwjvp7D/fDrmjqDfgW?=
 =?us-ascii?Q?EAgug1pKL4tmvRQfxLg5mUF9M3z6RltsXjc6axQzcme4AQ4zXUJasOteczIn?=
 =?us-ascii?Q?C7DPF42osxfKNG2i8XAsX1cjM3xjrIZeCpEduRKHlP8cyp66R7dEKwkM5lK2?=
 =?us-ascii?Q?iu5Nq26DHV5V010kM3C5g0cbUMferpEXjVWZZAQEF4ZC0kQwp1TyJI9JgL9R?=
 =?us-ascii?Q?BDIAa/e3r+6dhpJpB0YhX9ri61uCKsn/nYNog5qL61tDO8rIaY6jCB9/iQrN?=
 =?us-ascii?Q?vy/5LE3uOL/z99unm5Rk64/OOFsjImhxVgqLlFxDoE3NckIz+A5nTDJMaVL9?=
 =?us-ascii?Q?NA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e743f8-9743-42ea-c1bd-08dda9d11a4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 16:49:31.0956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GnCOsfjBYae/XdOYBYW+yfV8LGswaQHyj4vE6pKxCngYQH+xe0lgbTW/9LsdD0rMpfDdnvZbX/8P+44seg1+qYnsaLsWSXN45gY89F7uYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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
From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>=20
Sent: Thursday, June 12, 2025 9:38 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; igt-dev@lists.freedesktop=
.org
Cc: Harrison, John C <john.c.harrison@intel.com>; Dugast, Francois <francoi=
s.dugast@intel.com>; K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc =
CT dumps during fault injection
>=20
> > -----Original Message-----
> > From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Sent: Thursday, June 12, 2025 7:50 PM
> > To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Harrison, Joh=
n C
> > <john.c.harrison@intel.com>; Dugast, Francois <francois.dugast@intel.co=
m>;
> > Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Subject: RE: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress =
Guc CT
> > dumps during fault injection
> >=20
> > -----Original Message-----
> > From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Sent: Thursday, June 12, 2025 1:15 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Harrison, Joh=
n C
> > <john.c.harrison@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.co=
m>;
> > Dugast, Francois <francois.dugast@intel.com>
> > Subject: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc =
CT
> > dumps during fault injection
> > >
> > > When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv=
()
> > > functions, the CI test systems are going out of space and crashing. T=
o
> > > avoid this issue, a new helper function is created and when fault is
> > > injected into this xe_should_fail_ct_dead_capture() helper function,
> > > ct dead capture is avoided which suppresses ct dumps in the log.
> > >
> > > Inject fault into xe_should_fail_ct_dead_capture() function along wit=
h
> > > xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct
> > dumps.
> > >
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> > > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > > Same as https://patchwork.freedesktop.org/series/148416/ which was
> > > reverted due to change from XE was still in review.
> > >
> > > V4 -> V5:
> > > - Fixed review comments (Jonathan).
> > >
> > > Test-with: 20250612080402.22011-1-satyanarayana.k.v.p@intel.com
> > > ---
> > >  tests/intel/xe_fault_injection.c | 30 ++++++++++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >
> > > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_=
injection.c
> > > index aa3a3a7c2..8245c558c 100644
> > > --- a/tests/intel/xe_fault_injection.c
> > > +++ b/tests/intel/xe_fault_injection.c
> > > @@ -113,6 +113,22 @@ static void injection_list_add(const char
> > function_name[])
> > >  	close(dir);
> > >  }
> > >
> > > +static void injection_list_append(const char function_name[])
> > > +{
> > > +	int dir, fd, ret;
> > > +
> > > +	dir =3D fail_function_open();
> > > +	igt_assert_lte(0, dir);
> > > +
> > > +	fd =3D openat(dir, "inject", O_WRONLY | O_APPEND);
> > > +	igt_assert_lte(0, fd);
> > > +	ret =3D write(fd, function_name, strlen(function_name));
> > > +	igt_assert_lte(0, ret);
> > > +
> > > +	close(fd);
> > > +	close(dir);
> > > +}
> > > +
> > >  static void injection_list_remove(const char function_name[])
> > >  {
> > >  	int dir;
> > > @@ -192,6 +208,18 @@ static void set_retval(const char function_name[=
],
> > long long retval)
> > >  	close(dir);
> > >  }
> > >
> > > +static void ignore_fail_dump_in_dmesg(const char function_name[], bo=
ol
> > enable)
> > > +{
> > > +	if (strstr(function_name, "send_recv")) {
> > > +		if (enable) {
> > > +			injection_list_append("xe_is_injection_active");
> > > +			set_retval("xe_is_injection_active", INJECT_ERRNO);
> > > +		} else {
> > > +			injection_list_remove("xe_is_injection_active");
> > > +		}
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * SUBTEST: inject-fault-probe-function-%s
> > >   * Description: inject an error in the injectable function %arg[1] t=
hen
> > > @@ -227,11 +255,13 @@ inject_fault_probe(int fd, const char pci_slot[=
],
> > const char function_name[])
> > >  	ignore_dmesg_errors_from_dut(pci_slot);
> > >  	injection_list_add(function_name);
> > >  	set_retval(function_name, INJECT_ERRNO);
> > > +	ignore_fail_dump_in_dmesg(function_name, true);
> > >
> > >  	igt_kmod_bind("xe", pci_slot);
> > >
> > >  	err =3D -errno;
> > >  	injection_list_remove(function_name);
> > > +	ignore_fail_dump_in_dmesg(function_name, false);
> >=20
> > This is better, though I think there's a stigma against giving a single=
 function a
> > boolean
> > mode switch like this.  I don't know where that stigma came from, but i=
t might
> > be
> > preferrable for you to just break the "false" case out and run it here =
directly.
> >=20
> > Perhaps something like:
> >=20
> > """
> >  static bool ignore_fail_dump_in_dmesg(const char function_name[])
> > {
> > 	bool ret =3D !!strstr(function_name, "send_recv");
> >=20
> > 	if (ret) {
> > 		injection_list_append("xe_is_injection_active");
> > 		set_retval("xe_is_injection_active", INJECT_ERRNO);
> > 	}
> > 	return ret;
> > }
> > ...
> > 	ignore_dmesg_errors_from_dut(pci_slot);
> > 	injection_list_add(function_name);
> > 	set_retval(function_name, INJECT_ERRNO);
> > 	ignore_dump =3D ignore_fail_dump_in_dmesg(function_name);
> >=20
> > 	igt_kmod_bind("xe", pci_slot);
> >=20
> > 	err =3D -errno;
> >  	injection_list_remove(function_name);
> > 	if (ignore_dump)
> > 		injection_list_remove("xe_is_injection_active");
> > """
> >=20
> > If you do that, you can have my
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> >=20
> I do not think, I am going to implement above method as it increases LOC =
count=20
> and not seeing any benefit with implementing this.
> Let me know if you see any benefit with suggested approach.

This isn't so much about the lines of change or the performance.  It's abou=
t the
expected style guidelines used for IGT.  I'll admit that I might not be rem=
embering
the style guidelines quite correctly and that this function could be accept=
ably within
the given guidelines, though, so I'll give my reviewed-by for now and reque=
st you
wait for someone else to also give this a look.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt
=20
> -Satya.
> > >  	return err;
> > >  }
> > > --
> > > 2.43.0
> > >
> > >
>=20
