Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11F1CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 13:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524AF10E737;
	Wed, 12 Nov 2025 13:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kot/o7oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA5210E737
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762955209; x=1794491209;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7Cm7fK3XZCTK0uki/mw3HpIgJmAzDpTU9UMXXtbVH38=;
 b=Kot/o7oi5iNmXQJ0cx+ITy3sr5FQau0SYMvRQ1FGgjIsdcIu3+XanBnz
 0ukHWTzKv/QYhr7tcP98vYD7sf263T50ay5lsnPKFMXlNzIXU5n0wyiLD
 L2RBn6yNrzX98taZhZzz+AEptrCcQ1dMXBI0AvhKwhXCXuYU28w+tKWyV
 cptQ+fLZ7FScv9tmd/CBzJwwRhy/d4I2rdeIMQXyapTqYKM8obzr3JEpq
 yiZ8/CJfqC2cahadkzFFrvdv7+G1mzwEsMdIHpF2YgcRbOVEwbBNJxyLs
 Ms3skiXHaV4fYvdSbMJnDbwBebsvpXpj642bfPVwXjrBv2ESuyITo+m/S Q==;
X-CSE-ConnectionGUID: PcV9bPxhQPuYLC+IKB0CBg==
X-CSE-MsgGUID: AciKpcToSBylEFu080kiSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76365160"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="76365160"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:46:49 -0800
X-CSE-ConnectionGUID: I+YMP4T2RjmeCdJyDM5QhQ==
X-CSE-MsgGUID: Pw3pRpr7TeihqiEdFn/TPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189073586"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:46:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:46:48 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:46:48 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:46:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xl6znHmhVagcirgs7jIsd6OrssCu6IMzZvFQgLvMNuPLhZ+3fa8C/afEAiM79d8eC63RP8/ojjtnKE1GdeVTKDedNDmOmhcM2gT3G/bxw3XH2nQuQEQLn5R/7iL7xLi1q9jJ1Erg3Fgk71kk8fUzRCntcJj7WGuWKCUc24s84ykn9hSUnz+dthj5byoXUomaRUb3Kbtlie0Yxb7+nOagMOO4LuMWigLNumwjLP2J6/0c/2xAO8cAcvXNSjNxZU2DtkYjkTg5TROTjiORaAodq7QynL/g1dylhUHoNFMD0d8UTKz2OxDjPaNTyzOYS4+ONdH9BcfXtyyHJcCfrHKPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDUUDCW9War+5TE7qPFyKKVTqnc/fJZUHthYVloFooE=;
 b=bpZ2IGXOR2JGR3pGPEsMtKxVoOKb14C7CNdIynrEtbjsF70C2pGfMI9YUpJNrEH4p6FzQAXx3XGYW8VCBlyjcCYJh50HYnlS1LUHxbeXn59swgS3GwDyjPU/nZGeahQHfAVJr4aYkpFI5ZgtRh6e1fnTRnBBB0gbyIhFYwkCYg3BTwZ2w625quOE6X3OUAumI8WncKJfwk5vnbDBtwi/9vLpq44FIHYtdShC/VwO0M9kU+0bDbxBtjpW2kXgEINBmx1fT/0yfPXDD9GpuQWtY0qswFiKne4QyNLbfau4teQy1c4GOGKzdnZQ9+GkdGaVJmL26ULkLy+CQYdIWPcusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 13:46:45 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:46:45 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 10/18] tests/xe_exec_multi_queue: Add dynamic priority test
Thread-Topic: [PATCH 10/18] tests/xe_exec_multi_queue: Add dynamic priority
 test
Thread-Index: AQHcSpVGUGS8hd+PhESlhZl5rK3HabTvIDmA
Date: Wed, 12 Nov 2025 13:46:45 +0000
Message-ID: <CH3PR11MB8434F8299B126429D990F5338DCCA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-11-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251031183555.1882721-11-niranjana.vishwanathapura@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CY8PR11MB7746:EE_
x-ms-office365-filtering-correlation-id: c28159b4-3d01-4359-eda7-08de21f1eb77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kfsCEHBUx1EL6KVLi+Dx9C+FYK4+WWnDQxEmBuZhG8JOoZG5e/sXjIcvgVq/?=
 =?us-ascii?Q?NsKMIHZrfLGyb1xyjtchMyt9+CUREbva1BnUS0sL5oRLlekFBJHJPoIdU5BM?=
 =?us-ascii?Q?huPr/khiuGNqXr75gNdnu8pYlE4xx9zTLZNE4mk9LSLZuac+daev/PQBZDny?=
 =?us-ascii?Q?s1EDpChIX/Re72rVbjDMk4yanOxrKwaEMvsGWAzVAeFlWXgH4Dc6s1Js7sZI?=
 =?us-ascii?Q?PQXeSiyAbne6BA1U7Kq977YhnDfjOps+b/BpePhyosaHwWc4DEDXl6ttUWh9?=
 =?us-ascii?Q?3ULicAkbDt78Ts0G7XZ14kt7V7oNJPdTR/IBGh0Xnb15MH+g4YUpPMoCKzch?=
 =?us-ascii?Q?Nje9hddouKXtT7axm+RPf2ZBKIKPcNV2MP2KrcL1aGgTOkCIvIEHcf1XltfP?=
 =?us-ascii?Q?qKKCQd321MinPZ9ROTomQuGqguc6hmr2SS6GAyUV60NPbZBJ4QcCP1/NVwpu?=
 =?us-ascii?Q?sDVdvfje77/E3nouIDi6rQ15e4XAiqje0pHhtmI0SEUw5h14ECB9c1WcwulV?=
 =?us-ascii?Q?p9dpUBtBJ6zCIAqSdUioX9cBfFhrH4UY3Z2W5pkxlPPkwvb5t8McsePgfTRr?=
 =?us-ascii?Q?0c8CUsf/HW4CIOF+nxyh83JSxBypWxv5dSVOM79e+Ruj1pEgrOuHKIh/77Yu?=
 =?us-ascii?Q?1190kGQM2kpvwwviEVXSZvH76TyjRURD8mblKFBRl+89zh5u7WqnF2HEpQzl?=
 =?us-ascii?Q?XGWIIyEGg++FHS/2+7IZx9mGa30LMk6j1qi6t7Brq1yxZopgBrI0PQakr/RL?=
 =?us-ascii?Q?SKc36b2ImyBfFD7Qc7vKvoKTz1HFCmQWxWfupyQFOnnQBj7kyZE+e0xGSnyE?=
 =?us-ascii?Q?/0N3bCYZ76TcdidDphZJtE7RfUks0Vo3c7T5QPFBmcy5VxfDKHEwocZQgVle?=
 =?us-ascii?Q?3j3XTIbk6im3w5WSqF8QU16iqf+8MT3gNB/HwdSwo+Vb0RyYrAtRuQccFeNe?=
 =?us-ascii?Q?6o0ARziBw9yWBf1SR2ksCsIZDx41t94zd7g6bymKInMlI/uxVufaYTJv2Lr2?=
 =?us-ascii?Q?awAPxeYiSXlrevdn40zI75l4o0yrCNMftqNcw5MHx4lRHEn9m1Hu94a8wNQW?=
 =?us-ascii?Q?kqdZaFMaplsD+G7oSXAMro2bhXZDQS5bwMAnZsY390P6RSknA/Jf7aMJF0YQ?=
 =?us-ascii?Q?h4G3o/3Wafn0R+nh4uF2P6bqcyYT3w0ZkmviF1J/DG5cVEfBc+6fh85jU1BI?=
 =?us-ascii?Q?ZbtCfRM6DTCTpBQMQIj2q0iIzZnME7ybaEYwLCtPbWINEu/2fnlDLOYu4Ccv?=
 =?us-ascii?Q?op7rSLMBpal2qz+i2vK3mClSMkUpkrBEDLE53fq18yAKWpPE9jNXHwmPP8SW?=
 =?us-ascii?Q?HwO+7bUM8jY1JlygG0lhgykMBiE9gaeLY8cMuqnzOwLfzmjWkfPWNJqkBfOs?=
 =?us-ascii?Q?CS6jdkaLSWDJUg2hBqQvjdOywrUw9+WONudKMgWctWRRyL0LfpHDILOdV0tF?=
 =?us-ascii?Q?XDSrepDQRG9cKDYJBKiVlfT8X++0Zz+suxMSydxA476m/a+pQhdET+qcX6eL?=
 =?us-ascii?Q?kYuouTB4D4XEKBtjpE02AyeVT3+YCOk6D8UJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VZOTHEOYruEUt6Yl+OQB4UVmsYqOTGShq6nEWek92ioRWXYXWi2TvinfzEnI?=
 =?us-ascii?Q?x/ezfqNYP7VJJEo+4Y9wtjze44PFR/8GCQIIVkCXBWuDrX6fIJkjwdYwws0B?=
 =?us-ascii?Q?F9YIpwHAWVguKMRmkr8qJBwqjtZo82sFWE+ZWAbUq+KNNlkbWXxoJIRUowqL?=
 =?us-ascii?Q?CqOYTKtX+RL8ITxUIApORMk3WthUNhE5Gig4WVEClcSsSifd0KbGWpJjy67t?=
 =?us-ascii?Q?n8PaP9eacRXtt4kU4Z2OLlQtSN21IJJ79pK3T0Ep+NvA7qyRroNO+RUQL3el?=
 =?us-ascii?Q?S682DXWBB24UUBj4R7MDiPQeQyIsyNwk6ecy55hLARpLKEZDpTlS8wexIGTD?=
 =?us-ascii?Q?EULT5ecWnMiSXUMituCS2oXCy7m30OQ41BqMD8l2WT1BIJankYiIrGu1s/S2?=
 =?us-ascii?Q?EP5CJMlzFYkYQGCnAPdILD4E7iCl4iYk6OYhmLXaizRAagAviLnqWewvEW0+?=
 =?us-ascii?Q?EDZsN1PhWZ8+xDZq5kUw+lZBtJ1uzkcc70Bk3xDxwiXw6erDpzaxKWu0j7nO?=
 =?us-ascii?Q?JgEZpjCRyJ9QMaRdKd/CAnRxUc4yVJHH2OWY6LyYYSutMlVSvZxGEV9vbtrT?=
 =?us-ascii?Q?PEIIt/42huc0UoEDQ7ouV/zRmB20ar7mZcuMbmb8qzBSXE6YK7JGiCGfdR1B?=
 =?us-ascii?Q?rEQyWE/LQXdqd+ujxPNk29R4YeoECBm3aJoxssT/reb7U60xgooV9kcFhWbu?=
 =?us-ascii?Q?87qZERXgx+11MWnNRW08KKmcDgIw+4+6dpm30R592f8zsZ3tBT0G5ocNlLOr?=
 =?us-ascii?Q?jpwB1XYFJlkO61eOzg3lES/m8yCxYsJELGkqjsxS9VJOJUDotVxyCjvmsBlH?=
 =?us-ascii?Q?IHSRFihdrr+12UQVHgECSCbzq2X9uLV++iXI9C0oOu+KvFncGso3IWFz0pYA?=
 =?us-ascii?Q?k/1ltlY3OW/KiZLEmK6wv7uaYc+tjvn8PbpZHvTMvGIdqo111i3XaDGiy4rY?=
 =?us-ascii?Q?4K2CO/JtircsII8VLJTE/XFY7jOrjNRQIqxzfX9WkVLWhHE0mlPcKlv4Kkw+?=
 =?us-ascii?Q?16WgRLfQ6r20L/vJqyA85qzmU2JrPhO492WsKk97aXOeoiy7Y6MUqw38W9XA?=
 =?us-ascii?Q?r8lTufZwB4wsb0M7JxOFUIboshgdTiP7oMPjmLxAZAs6IORKMBiaADghQ56Z?=
 =?us-ascii?Q?Tc+qHzGnDIiK54gyB6oXYNu5vODgtHNBVILjNtg9w5182ru7QWbECqhRah/S?=
 =?us-ascii?Q?9/EYb7BWA///nMjvYn10GvjCZ3P3xwLjje/kEhIFLIhl0ALKC/UQ6mqXiRoX?=
 =?us-ascii?Q?8HCZUvQgAbMex78/fRKSB+J236y5ndsFLRjWx7CV3T9SShxbApFsSQPcfLfI?=
 =?us-ascii?Q?L8xb4iUGFnT02Em0ycm0xB1971KAM542hZpOj8kSu0gyj9pzvKiWRx/XmlI2?=
 =?us-ascii?Q?1d4WYLYyTzRiEt5Dj/v0Cd63PbLK77LBV4QWPn3GV+15JBqgw8Xg1v2Ent8L?=
 =?us-ascii?Q?sXm24Zo7iCkvhOs6Wi/OWizjiHDziRMvZb6XuDHEjdkj+s0sfltEJ9hw0BR8?=
 =?us-ascii?Q?2od+v53dJNefVQprEJsMyvth3gE/aQZl6LLcuhQcGytRwXz9HwFraanIO+qZ?=
 =?us-ascii?Q?zszjX7Zt7+MxgBI5vGHj8wFgMEGefDlGgm4693BF1QtYuLGs9foZxR1Cwsa0?=
 =?us-ascii?Q?bJyS4q+tsz7RXVxSDPNvvMfziXE9zS641t7cz4G9oFUQe5zEjhPDGBHrqGq8?=
 =?us-ascii?Q?RqhnVw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28159b4-3d01-4359-eda7-08de21f1eb77
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 13:46:45.4383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbVVo2+tg9NmsVpYQ/vXEdA2TI9TLlrY5ebEDBwHYESQ8RN33LbPJWo+hxtVN8yiSef0Nrn1ff1BWvbJESpcW7kIM8HT+kwL36rkG9PWm4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: 01 November 2025 12:06 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH 10/18] tests/xe_exec_multi_queue: Add dynamic priority
> test
>=20
> Add subtest for basic functionality of dynamic priority change using
> set_property ioctl.
>=20
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  tests/intel/xe_exec_multi_queue.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index 191c55fdd..016979337 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -29,6 +29,7 @@
>  #define PRIORITY		(0x1 << 1)
>  #define CLOSE_FD		(0x1 << 2)
>  #define PREEMPT_MODE		(0x1 << 3)
> +#define DYN_PRIORITY		(0x1 << 4)
>=20
>  #define MAX_INSTANCE 9
>=20
> @@ -305,6 +306,12 @@ test_preempt_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_plac
>=20
>  		exec.exec_queue_id =3D exec_queues[e];
>  		exec.address =3D batch_addr;
> +
> +		if (flags & DYN_PRIORITY)
> +			xe_exec_queue_set_property(fd, exec_queues[e],
> +
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +
> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2));
> +
>  		xe_exec(fd, &exec);
>  	}
>=20
> @@ -438,6 +445,11 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>  		if (e !=3D i)
>  			syncobj_reset(fd, &syncobjs[e], 1);
>=20
> +		if (flags & DYN_PRIORITY)
> +			xe_exec_queue_set_property(fd, exec_queues[e],
> +
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +
> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2));
> +
>  		xe_exec(fd, &exec);
>  	}
>=20
> @@ -505,10 +517,12 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>   * @userptr:					userptr
>   * @priority:					priority
>   * @close-fd:					close fd without destroying
> exec queues
> + * @dyn-priority:				dynamic priority
>   * @preempt-mode-basic:				preempt-mode basic
>   * @preempt-mode-userptr:			preempt-mode userptr
>   * @preempt-mode-priority:			preempt-mode priority
>   * @preempt-mode-close-fd:			preempt-mode close fd
> without destroying exec queues
> + * @preempt-mode-dyn-priority:			preempt-mode
> dynamic priority
>   */
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
> num_placement, @@ -557,10 +571,12 @@ igt_main
>  		{ "userptr", USERPTR },
>  		{ "priority", PRIORITY },
>  		{ "close-fd", CLOSE_FD },
> +		{ "dyn-priority", DYN_PRIORITY },
>  		{ "preempt-mode-basic", PREEMPT_MODE },
>  		{ "preempt-mode-userptr", PREEMPT_MODE | USERPTR },
>  		{ "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
>  		{ "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
> +		{ "preempt-mode-dyn-priority", PREEMPT_MODE |
> DYN_PRIORITY },
>  		{ NULL },
>  	};
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  	int fd, gt, class;
> --
> 2.43.0

