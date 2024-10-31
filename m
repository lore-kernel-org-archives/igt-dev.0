Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4BAE67480
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 21:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E0E10E429;
	Thu, 31 Oct 2024 21:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gC2glyxe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69D410E933
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 21:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730408884; x=1761944884;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AADmpYTb14VCdbaP2OnwX7sE6DM8yY1Ksg3vj8QtbDE=;
 b=gC2glyxeWJT09aJM+/N2W+GDepEMeDpYjgtepREAQaAQDlRgHu9sSUzI
 fD/ypA42nFP8Yu8qPEfYJ/9ah/+5C9rq5ehJDrZU/Jnt2083Pnvyf04w0
 0Hu3vWNkhtn74PRQ0U7fsK698dKrXew/ryGbMgyyhSDR9gDiZYywFM77m
 +CpfyGR2jqQXJqcuNKFo1MkFBiCOAdL0Ix0nDPS/wBHgcW3URNnVQGQ0M
 u6WylhknjAQ4ZrooHjIvKVIEW/xepHI8DRNa2kxLinq6BS37HXqdrEELP
 SZ1Am1ulz3vT692Vx7RjnaJ70VjYPfATRr7IQR6bWbKgjXbOhQz2GhYKr w==;
X-CSE-ConnectionGUID: pCn/6LXWTDijs5OhdDxY/w==
X-CSE-MsgGUID: mvqmDtczTrW+o6mUMMnKIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="41560798"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="41560798"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 14:08:03 -0700
X-CSE-ConnectionGUID: ZqicI3QmSIWoaRtp4xT1GQ==
X-CSE-MsgGUID: 3peem++nTWOKmnE4Vy4TCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="83099680"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 14:08:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 14:08:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 14:08:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 14:08:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tESzKIAylk3vhlwZaRG5mnKcF9ef+1oAoYiXnUbiefZqGctxE8+C1w0TsPDQYkXINlDZiCtwb+BKYD2N4OUZt0yrhLQF3v4bZC4RN7BhgSOZgOo4aAedwT//7ggcBgBZV6q7d2cXL9p7/+gCACcIfBy1/4Qm9KyPM1DWk+EdvePCW4/uH8O5GsoE2Q3ukeFalAT/Jm4GIk1w53VseZByHN2VQXQoOQBDtmu5xB5sd9zAgVz1lI4jg1gpe6dpiRz1OZxjULkbyFJzQKrM2W1SreKTGhcIW6GgJGlHrTeBSskEtE0Wgz7tfq5H3z0m5nLwuEcuw9G4N6cpNKkZYZVRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYtX1Z0a0Gc/CC3EWwiWi8d1xwHLA7cBNiT6w3zsp0k=;
 b=asMgToNq2ORN0/2y4n61dzkKOrj0E48hCmgyvyMooudrX7u0uIM3AEqk6cV06+stG1TOJ6U3rAQq+p1dQUoRjGVNg0V25Bs8kN6Zn2Ikd9DPEp5eTngTAKSTwy5c9FbFEl/Ju2YFTSXvyTrsL4HbLsh+SoCqYIHf0D/ldXWcKC/HSvaDu4o4iDZtKQ28Raa4tHBQ4RLSTXkjCgqizgjgXh8PzIW4o+bSyzPnIx0yCuMAX1Co7eLWR901ly492w0oR/EpCoa1XF1PnEbtfzsp+qA0PwUrOSMUULroUOfmqnbWbPipcGSFGDt5nggfRScin7rP9M80VHncNjjsupZoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7550.namprd11.prod.outlook.com (2603:10b6:510:27d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Thu, 31 Oct
 2024 21:07:51 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 21:07:51 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 1/2] tests/intel/sysfs: Restore sysfs values on test
 failure
Thread-Topic: [PATCH v2 1/2] tests/intel/sysfs: Restore sysfs values on test
 failure
Thread-Index: AQHbK7Jqxoa1xbjzl0aAIJH2wWkyFrKhKpUAgAAkTuA=
Date: Thu, 31 Oct 2024 21:07:51 +0000
Message-ID: <CH0PR11MB54442099821E3D8F7582E14FE5552@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241031163122.37356-1-jonathan.cavitt@intel.com>
 <20241031163122.37356-2-jonathan.cavitt@intel.com>
 <20241031181622.aslg426dj3ty4jvh@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241031181622.aslg426dj3ty4jvh@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7550:EE_
x-ms-office365-filtering-correlation-id: 434874f1-3cb8-4c78-5a87-08dcf9f014e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ZMJELRL0px9IJ5Wj6IzjxXl3X1x6Sfsm7iI/58PCjhwjrUJzAsf8mCCCqSPe?=
 =?us-ascii?Q?AjgX23TDTQtN2IYFSZqf40AijgKby+Ee+rcgjKRhu/ptmAcDa2ZoQtoz4SxR?=
 =?us-ascii?Q?R72V8vrQFOkQZdEZluQzsMMsb8PopAvdYmx20LEWUK3fr8/kV2U4dGSy7yKl?=
 =?us-ascii?Q?9kIAvyn70BVkh3EJJjGCCe9hwvPqgD7f2dxM6bEOnw/+QFLkydq/7mQRGc30?=
 =?us-ascii?Q?K08EV5ebfpLY6FYwu8EZfLa7JxZA8dlsGHft/XCPvaKaHFpLKx2hE9S0mbDx?=
 =?us-ascii?Q?wIu9SDExg0b/yvP3mS6IAfphSFGSH16APhnxVAtarYee+EJBg8bWh1mal0w+?=
 =?us-ascii?Q?eZPz9+iuJpSKisbsenYAKt0ilIDwv5vAKstCrCoE09HSTGq30JqzBzy0moiu?=
 =?us-ascii?Q?niWb9e3KYBA93WDNknfy7NssrJ1MvZ8dQ8QOw1mh3nLImngx6tOJJIfvOAQV?=
 =?us-ascii?Q?YJ0ryh2sY9uxKo+BD1SFeGw4sT0d8qsNT7cVXi9RusXXVhGiNJ5TtvuDFdjS?=
 =?us-ascii?Q?IH2ZET4dRXvXew5LY1D1qI7rwznml0ywuXkRYWekulvn9CO93AjNjyR7u5ZR?=
 =?us-ascii?Q?3OLnKrZn+hrC4QNvllwALGK24ZEzQj03Nm2VmGmDHSvmxuqwIwKBGiitUOHz?=
 =?us-ascii?Q?RBxYku8ufrN3W8A91D01zOXC8uwKCwh7wqCD4Xh4tFS76iNNlpr5wWKr2Kz7?=
 =?us-ascii?Q?/kJma5XOJGs75ZnvrkZjh2QFdW43p+Lo+mTxG5ArVlTG4m6QsmWvgiZ9yyEg?=
 =?us-ascii?Q?qxSTS+rOa6fsEIV3O0ycJ8cR1BCLyhvR0ImHaLs+vS0TkACI4pjgogHkdDhP?=
 =?us-ascii?Q?iyxhcXdmHkg7C4EqYGaPT1KQF2bAJOhzrxoxg62OQc0P4RQSfeOPSuxmoObI?=
 =?us-ascii?Q?WHpgYm2psCVfzy70eAKnSHDdS+7VVopJ2BxV84580hgVJ/QxqCsuvqqlZpsK?=
 =?us-ascii?Q?pZnvpzcBba2eUSjVNMh+4xLLVUmEgGC2RhTdjKMpwVPo6+7T+bPBeqJx2oVS?=
 =?us-ascii?Q?HsyjzVkW1wMLsLG1UxHoHrbv+6kNXCMSREAU5vDyXE4afN4scnf63hStwFp5?=
 =?us-ascii?Q?uwiMjYu6QfvZJa1ea6ekKXpAnm4dBlXbeUv71EgP4qzkHvmI7e8jmaqQCZhG?=
 =?us-ascii?Q?Clo5gY0vNDXJP3TqIeh/X14LNm8EMbXPLixDiJWdAjGbscr1C6Lvst+9eKh8?=
 =?us-ascii?Q?TLZaK7avqKl+FuE1GizZYwZL34XHbbNa3CPhBN4qd1kKVLKqxUwE4PirhIru?=
 =?us-ascii?Q?KpfoUAMMMCuGs+aecPDJaeDuNTh177kGuQc18DgulYlDHaWkFIyg2F7ZVWWu?=
 =?us-ascii?Q?Qmnva8zGR5acUkFa8Ln/vVGa0N+93Swd8UWpZYDS6VHKlX6OwB1CRm6a8uFh?=
 =?us-ascii?Q?dNSnN6U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mwlW3QatAQ3N9WmCP7GwBbUr+I4Pp5BzU/EInl5z9KtmXn/HEdu/FJm8ukyX?=
 =?us-ascii?Q?AZyzafRLppMLPGfVgpkW+W3IXsxDpP3iY+cAVvqVooPZs1BpBFXOx5iJ0SUU?=
 =?us-ascii?Q?Ni5Q1OvUUlWaYDdEi+VX3FHhA878t5dkDu6pBx/3KsMkAiuKWlWACtpM4B41?=
 =?us-ascii?Q?zN5Vy9QaGW8BwBQ4Laou3RnFSQzqBbDLYTbneBtD9AlKPt8MJIeArm0NrsMb?=
 =?us-ascii?Q?fXPFUoO6RU2OL5utxijtw0gUWE59n6/bjHY+BNgW9UKP4A65WNmy0m8djcnQ?=
 =?us-ascii?Q?Pl3ydY5k3v7B263VWZ7AMAWTmiPjT3jmmpmYqoH1S/HFmPM7/RaCHXzy9ahU?=
 =?us-ascii?Q?ofKXKVd1uP7AD1TFeki5fSYOk9TrfDvW/qnZ3NiXnF7aIFc3KqIezlCJ169v?=
 =?us-ascii?Q?qIObj/m6rYCNe6vRyucKc3gcbZY698POfh144/0gxtMcubkS5DQI3jyPbm3Z?=
 =?us-ascii?Q?wsWk5wIWVH9RFKoTfBi0F3U0edlNM7A/gnw8GkoGTnO8bX7+zAdnR/uD2PKk?=
 =?us-ascii?Q?tGS5bRpasdpPCNsDoeN7E6CGBcWAi5Qch4BbNeAHDOLuVLsIBprCiqJ+I5SH?=
 =?us-ascii?Q?qA2eHn6+GlzAgPil5AYffUDSuvQ13+8C9QboViNh98++7ZtuKfUfR6lxAvOX?=
 =?us-ascii?Q?GZYBiDGf7T3OVHGtlN0YIDOy+FrL6M2IrfRkiOUgjueB3CE6OgcUPaYOLx1V?=
 =?us-ascii?Q?GGDKlwZZVWcmvLLFhv6tOKtHFdbC1cDRtxbe+BPcs7A3k+eltK6gz0NzvWPv?=
 =?us-ascii?Q?LVnx76yCrfePYPQnGJ0RelGt/UAFMdFtrpt+gq+iCj6cX/docDPrLJl0TAiB?=
 =?us-ascii?Q?eMGjKBwQ++c8Bo4e45qHk5sKjG9MWwfKCenC13763NGBRwP634BHUk1+upAN?=
 =?us-ascii?Q?GwefjhGRZghEeF6u428BpuLgrl/xfF2BfN3eDL0XLL97oR4u+LHTIs7AoofF?=
 =?us-ascii?Q?7asfR6SeIoo4NcsMi5pvB47shCDqGMdzTMC5IyyjiUsw8QBjxV4RJcceDdPk?=
 =?us-ascii?Q?ADBV2/st66MI1POOgzTNU8HiUGIkfWbMiMUmQEJSRan+dtA70lBu3kd4lNO7?=
 =?us-ascii?Q?qoXBQ436kWSnk85+tx3HHM16/rnqDAZfccM0x2j7EjaPh6yMlBJk39iY9sjh?=
 =?us-ascii?Q?uWwRbqzRD6ep6D8RMsc+INUZzPnG9vl8DfhFEDUWawctfEwuKn3Qo3yVs0vZ?=
 =?us-ascii?Q?HeS8HJYJ4uIkJlX17Od90Pi3MsU7J1Mv/W1sRxihkt3CjujzwZNKzFKxkFLu?=
 =?us-ascii?Q?S5D6Het2rfA9B1WrdMz/y5vNeLwCri/8qqfk7xSGTRwaNF7h4e/Qlcno3thL?=
 =?us-ascii?Q?pqSWctxR7fHKEqrQpMmFlXiQXx9t3/arPjCGJEoo8CELq5dMYAh8RTZREVoI?=
 =?us-ascii?Q?OBgRdRjvJncHjalJlHVYrLVhyIdwyyh1DhEzDWdluj8dSPVLR1pxI8cxKO+K?=
 =?us-ascii?Q?YVMYE7UtBGI3GJs6SCpqXdu9lHNB0b2v4bp1JwMs4D5pcCAAn2TJ9SmRhMXv?=
 =?us-ascii?Q?/2Ke1lEUlNL50xBLDc9Ii05O1ueqkAFPoimR6+bpTV8FUfSPUgzCAJZfkSeg?=
 =?us-ascii?Q?46jeM+uheKl403tEe2aTtGor0Z9+pZ68RO62K+v2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434874f1-3cb8-4c78-5a87-08dcf9f014e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 21:07:51.7433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QFwy7dgiso1lNLe3W5pxo6FMJx3oX6UEV3odpXT4xrgUD9hrOxDiiqht5oE5La9bmB5XeDAbqrW0YRdXYMhzeyBZX4kHtQzKrQLddHtj+aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7550
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
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>=20
Sent: Thursday, October 31, 2024 11:16 AM
To: igt-dev@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg=
.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Belgaumkar, Vinay <vinay=
.belgaumkar@intel.com>
Subject: Re: [PATCH v2 1/2] tests/intel/sysfs: Restore sysfs values on test=
 failure
>=20
> Hi Jonathan,
> On 2024-10-31 at 16:31:21 +0000, Jonathan Cavitt wrote:
> > The tests xe_sysfs_preempt_timeout and xe_sysfs_timeslice_duration
> > modify the values of preempt_timeout_us and timeslice_duration_us,
> > respectively.  However, on a test failure, it is possible that these
> > values may remain in their modified states, resulting in the values
> > being used in future tests and causing unexpected behavior.
> >=20
> > Save the respective modified values before starting the test and attemp=
t
> > to restore the values on test exit.
> >=20
> > Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>=20
> Thank you for the patch, I have few nits, see below.

I'll attend to most nits for the next revision, though I have some
questions about the rest.

>=20
> > ---
> >  tests/intel/xe_sysfs_preempt_timeout.c    | 34 ++++++++++++++++-------
> >  tests/intel/xe_sysfs_timeslice_duration.c | 33 ++++++++++++++++------
> >  2 files changed, 48 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sy=
sfs_preempt_timeout.c
> > index 7fa0dfcdf7..1b9c26bfdc 100644
> > --- a/tests/intel/xe_sysfs_preempt_timeout.c
> > +++ b/tests/intel/xe_sysfs_preempt_timeout.c
> > @@ -183,8 +183,10 @@ igt_main
> >  				       "preempt_timeout_min",
> >  				       "preempt_timeout_max"}, };
> >  	int count =3D sizeof(property) / sizeof(property[0]);
> > +	int gt_count =3D 0;
> >  	int fd =3D -1, sys_fd, gt;
> > -	int engines_fd =3D -1, gt_fd =3D -1;
> > +	int engines_fd[8], gt_fd[8];
> > +	unsigned int pts[8];
>=20
> Please use define here, for example
> #define MAX_XE_ENGINE 8
>=20
> 	int engines_fd[MAX_XE_ENGINE], gt_fd[MAX_XE_ENGINE];
> 	unsigned int pts[MAX_XE_ENGINE];
>=20
> or allocate/realloc/dealloc it (it could be then a struct).
>=20
> > =20
> >  	igt_fixture {
> >  		fd =3D drm_open_driver(DRIVER_XE);
> > @@ -192,26 +194,38 @@ igt_main
> >  		sys_fd =3D igt_sysfs_open(fd);
> >  		igt_require(sys_fd !=3D -1);
> >  		close(sys_fd);
> > +
> > +		xe_for_each_gt(fd, gt) {
>=20
> Check
>=20
> 			igt_require(gt_count < MAX_XE_ENGINE);
>=20
> or reallocate.
>=20
> > +			gt_fd[gt_count] =3D xe_sysfs_gt_open(fd, gt);
> > +			igt_require(gt_fd[gt_count] !=3D -1);
> > +			engines_fd[gt_count] =3D openat(gt_fd[gt_count], "engines", O_RDONL=
Y);
> > +			igt_require(engines_fd[gt_count] !=3D -1);
> > +			igt_assert(igt_sysfs_scanf(engines_fd[gt_count],
>=20
> Why assert? imho igt_require should be enough.

Because we perform an assert on igt_sysfs_scanf during the test itself, so
I elected to use an assert here to be consistent with what the test does.

I'll change it, though.

>=20
> > +						   "preempt_timeout_us",
> > +						   "%u", &pts[gt_count]) =3D=3D 1);
> > +			gt_count++;
> > +		}
> > +
> >  	}
> > =20
> >  	for (int i =3D 0; i < count; i++) {
> >  		for (typeof(*tests) *t =3D tests; t->name; t++) {
> >  			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> > +				int j =3D 0;
> >  				xe_for_each_gt(fd, gt) {
>=20
> Add
> 			igt_assert(gt_count < MAX_XE_ENGINE);

You mean:
igt_assert(j < MAX_XE_ENGINE)
?

The number of gts grabbed by xe_for_each_gt shouldn't be changing
mid-execution.  So j should never exceed gt_count, which with the
addition of the prior assert, should itself never exceed
MAX_XE_ENGINE.

-Jonathan Cavitt

>=20
> > -					gt_fd =3D xe_sysfs_gt_open(fd, gt);
> > -					igt_require(gt_fd !=3D -1);
> > -					engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
> > -					igt_require(engines_fd !=3D -1);
> > -
> > -					igt_sysfs_engines(fd, engines_fd, gt, 1, property[i],
> > -									  t->fn);
> > -					close(engines_fd);
> > -					close(gt_fd);
> > +					igt_sysfs_engines(fd, engines_fd[j], gt, 1, property[i],
> > +										    t->fn);
>=20
> I would prefere this in one line, or align to 'fd'.
>=20
> > +					j++;
> >  				}
> >  			}
> >  		}
> >  	}
> >  	igt_fixture {
> > +		for (int i =3D gt_count - 1; i >=3D 0; i--) {
> > +			set_preempt_timeout(engines_fd[i], pts[i]);
> > +			close(engines_fd[i]);
> > +			close(gt_fd[i]);
> > +		}
>=20
> Add newline.
>=20
> >  		drm_close_driver(fd);
> >  	}
> >  }
> > diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe=
_sysfs_timeslice_duration.c
> > index cf95a3ac1c..914575a282 100644
> > --- a/tests/intel/xe_sysfs_timeslice_duration.c
> > +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> > @@ -155,8 +155,10 @@ igt_main
> >  				       "timeslice_duration_min",
> >  				       "timeslice_duration_max"}, };
> >  	int count =3D sizeof(property) / sizeof(property[0]);
> > +	int gt_count =3D 0;
> >  	int fd =3D -1, sys_fd, gt;
> > -	int engines_fd =3D -1, gt_fd =3D -1;
> > +	int engines_fd[8], gt_fd[8];
> > +	unsigned int tds[8];
>=20
> Same here, use define instead of '8' or dynamic alloc.
>=20
> > =20
> >  	igt_fixture {
> >  		fd =3D drm_open_driver(DRIVER_XE);
> > @@ -164,25 +166,38 @@ igt_main
> >  		sys_fd =3D igt_sysfs_open(fd);
> >  		igt_require(sys_fd !=3D -1);
> >  		close(sys_fd);
> > +
> > +		xe_for_each_gt(fd, gt) {
>=20
> Same here, add guard for 'gt_count < MAX_XE_ENGINE'.
>=20
> > +			gt_fd[gt_count] =3D xe_sysfs_gt_open(fd, gt);
> > +			igt_require(gt_fd[gt_count] !=3D -1);
> > +			engines_fd[gt_count] =3D openat(gt_fd[gt_count],
> > +					                  "engines", O_RDONLY);
>=20
> One line or align to 'gt_fd[...]'
> Btw use checkpatch.pl from linux kernel, here are too many spaces.
>=20
> > +			igt_require(engines_fd[gt_count] !=3D -1);
> > +			igt_assert(igt_sysfs_scanf(engines_fd[gt_count],
>=20
> Same here, igt_require.
>=20
> > +						   "timeslice_duration_us",
> > +						   "%u", &tds[gt_count]) =3D=3D 1);
> > +			gt_count++;
> > +		}
> >  	}
> > =20
> >  	for (int i =3D 0; i < count; i++) {
> >  		for (typeof(*tests) *t =3D tests; t->name; t++) {
> >  			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> > +				int j =3D 0;
> >  				xe_for_each_gt(fd, gt) {
>=20
> Same here, guard 'j < MAX_XE_ENGINE'
>=20
> > -					gt_fd =3D xe_sysfs_gt_open(fd, gt);
> > -					igt_require(gt_fd !=3D -1);
> > -					engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
> > -					igt_require(engines_fd !=3D -1);
> > -					igt_sysfs_engines(fd, engines_fd, gt, 1, property[i],
> > -										 t->fn);
> > -					close(engines_fd);
> > -					close(gt_fd);
> > +					igt_sysfs_engines(fd, engines_fd[j], gt, 1, property[i],
> > +										    t->fn);
>=20
> Same here, one line or align to 'fd'.
>=20
> > +					j++;
> >  				}
> >  			}
> >  		}
> >  	}
> >  	igt_fixture {
> > +		for (int i =3D gt_count - 1; i >=3D 0; i--) {
> > +			set_timeslice_duration(engines_fd[i], tds[i]);
> > +			close(engines_fd[i]);
> > +			close(gt_fd[i]);
> > +		}
>=20
> Add newline.
>=20
> With above fixed
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>=20
> >  		drm_close_driver(fd);
> >  	}
> >  }
> > --=20
> > 2.43.0
> >=20
>=20
