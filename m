Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536BFEFB81A
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA3D10E52C;
	Tue, 24 Feb 2026 08:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7WcWu7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399AE10E526
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771923343; x=1803459343;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yd7NPJvWo2oONA06sEPuo9kuh64NActzebPZ0djvLjM=;
 b=Z7WcWu7S63HQyuueu7/9m6nY5o6zJ/VlQcoYVzq0NqiM/wrlq0GECS7n
 /i9SP2ZM1oURiVGjdoJH6CvT29PstkY0R73W7CN9PcSGJzyZeRRQfeZg1
 zxH/fbfWMhHSiXuxxzyeB6UGFGJqdurCRqTva2KXqT9PbX5crd8vqAwpW
 zD8C+gZFrE0RD8cAxYGVJVuhgiZQ+frZhiT1OCwV1AUPdGPtBd4f2edA0
 HI2y4/SEvLK5nM84UrTms984zJLh67foXvo4bTgTuO1ySBMshplN9OS8i
 e1Hp+alxwQ5sm3JZXVt+bd87SLj72myW1KknM2iKDdUJnAPVAas/3pY3+ g==;
X-CSE-ConnectionGUID: IDrXsQVVRTqN0wXfpexy0A==
X-CSE-MsgGUID: l1XdQYCATqW7SOnmDuH+/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83643391"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83643391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:55:43 -0800
X-CSE-ConnectionGUID: b92fxjA3TziE0DFhjzTLqw==
X-CSE-MsgGUID: DIk32Nz7Qi+ArlG9K52lFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219333487"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:55:42 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:55:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 00:55:42 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:55:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpcOKuWYv9N9szmgFucsUGEuRACnsgFxGj1j64iGMsfuT3TTTCIoDq8EjCnIr37uYz39IBQdA0O0//IzmZT2A8DwhlSkV/6AIlntrAkgb2a5vwc+AcYzX2hEUaiDuEN6YoamEd1+ULptuglkDacp2Xjmr7QWiyry4H2zytZk3Wt9Aj9x2caUEYg1C9i6W8TurXS3RJuaMJWxIko4rKmoLqcxNRLBOB+K2gfkKrvJkT5+Vf6EJvOvDbQW472SZwW4PYLJ/AmhMNu08KVpQP2JMJ2JZedYjVj/89lFMmscDCEH4wcZb0xU6AfHZHl9y+y7EzM8s8m4lTiuNWMIHNKvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aDVlw6FJ/hw9XXKFGCqmcZTLt2F6ltRisr2ApGMyJs=;
 b=K7xViXoibbijQaYXK0Cky7FhFWctMQLh+3u774OLFvrS+73KZ3VkY1Tof/lN5cOpjCps9AlmaHXfS8/mZZ6RnT+IsW0bpL44ltx1pnhVwel+zFQIXrMReZPwxflRSqC868LS0RV6vynb/vq6UYINMznB0l9xrd7xtzCIQbsXrwtfQffIdk9dQxd4GtaO2A+CCrs0au4Poz0CA7J+BrpjWqd4Adjtq/QDIhhFDNv6sPSYi+Xq8el06WQdozp2319LcDLRbL6WdRDwMmtcx9YuBVwra3nG5mVhZmmEkqfDF0cxzdUmpkXXVxURt3pdvE+solP1kpGRGIAKmiKzByMQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 08:55:40 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:55:40 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_exec_store: Extend test coverage
 to all memory regions
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_exec_store: Extend test
 coverage to all memory regions
Thread-Index: AQHcpU8iltSDSBGxVEqaTMZcogzfQrWRi+/g
Date: Tue, 24 Feb 2026 08:55:40 +0000
Message-ID: <CH3PR11MB8434902236EC159B9767B1E18D74A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260224053324.2354159-1-nishit.sharma@intel.com>
 <20260224053324.2354159-3-nishit.sharma@intel.com>
In-Reply-To: <20260224053324.2354159-3-nishit.sharma@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CO1PR11MB4977:EE_
x-ms-office365-filtering-correlation-id: 5b48d11e-9dfe-42da-a1a2-08de73827c65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ib8elAtKYapu+KvgrMBHr//8+OWsYRBZoigVHPzh4PXYUQjWzRmSUjW5G+c3?=
 =?us-ascii?Q?kspCJwd5+TATBHfwcaJj1+/P2jdbO8LKoVjm3JMH+PtnmfR2ONG9q8MqzvyA?=
 =?us-ascii?Q?XQrYhqonMCJO06N4nRdXVfvGRbskRVDNul9vXOyibm05WpIpb01z+4vps9GK?=
 =?us-ascii?Q?Yd485LcoDy/Igzr18W7vnXoY7vSYhk172wCieogtO0hDqjgtjafGTD7n3Bzt?=
 =?us-ascii?Q?XrD9m9spI82mo104O+XQzbwA4eRhmloCttWjVuyzN5jZxf8s18rQ2jKrWoWM?=
 =?us-ascii?Q?DwtoBduLcNK4+3VNUsRvCZAZZnRQJLg1c9TCpIPWPqMfNX4g2cWfmCbQ7riQ?=
 =?us-ascii?Q?64Wd3zejY/SZ1oVmBxm/BluWzMNXNOkdAiWEAupYIUFukkL/+cPYQY/iuL0y?=
 =?us-ascii?Q?QBaUfrbwf9ZFmRA4bssuejpRjDPaZLLCiK7wmeLK/Xd3dTfIGrhy6PYZZ4rX?=
 =?us-ascii?Q?iTHDvpasMKeNSlPhAl0waboeub9oNO41dTD+2o8qqdbjJHBhcO81l+YHYsl5?=
 =?us-ascii?Q?rq4gbJwyPxvUBNUY67LUs8pw4MtCgdcLVglfQQkOu73VZmo2FssUUgTbTpg9?=
 =?us-ascii?Q?09eJh1bnEltfXxQdwUwPgOU6SxKhFZZAA/XD4cgzx6cVifF3fwDjp8YeYUUW?=
 =?us-ascii?Q?Fa6gmy9+Rj00BPQHvkwmg9NaWYY+038ozQM+MD2ECzdPnFejSlZZNnnTQL+z?=
 =?us-ascii?Q?iNzrFFW69ONu1hu1DbJQgGchFqdlsE7rTP6sSkhJMUs9v0v09i20+zmcVs/N?=
 =?us-ascii?Q?0xxodeU8ZilZE/EoRXStUlITSwDbFF3AbCemHem+N08LfRZMw/2eZ+kf0Izc?=
 =?us-ascii?Q?TSIHZeBtufw0TGtmWvNcZg/+kBC+EZ92F4koLgZAD3/vUi9I3FrE8yP9tJp5?=
 =?us-ascii?Q?RYy4hjlPtoH9JAhLI8tcEnl/w/N05qPF9+mtXwkzfe1fnyrU8Hp2poDB0Qty?=
 =?us-ascii?Q?P8fVmFopQf66vGGWyPQEKeZZUoHBbQRcmCLXzlb5FEOknn2BReW2vkVmGrVz?=
 =?us-ascii?Q?qPNkFEUq/8xjUNcQpLgHootUlRB1FGfx2mBSPO1xdH9hXpVmPj95J/UJkeih?=
 =?us-ascii?Q?ZnYr9qj3I0FzDfVFhqpTTBKrggtI1vmYf/bb9qIhBwcyB8c6ucVIV4Sllw8H?=
 =?us-ascii?Q?JVjw6912JZ5wtF/p+2mOGNSySYmjHQPggoUJx9TFUQqhsD1nTt7JSIQmA5OI?=
 =?us-ascii?Q?zCfH1NN5X9Sgaoj4vF7/LYl2gThDBMpt1DaWdV2l/JZKCEl1UDDR4MC3GwF1?=
 =?us-ascii?Q?lLm4RPIRwxpbzLdmM3tR8FcBv4gO+QSj9zK0bW4YGsdoz19CpXHR87ef79/L?=
 =?us-ascii?Q?LzK34u5hLBIr1WhfvlbWyW1G4ROyq6Qq52Slrf5IuLOU/p0ibJNwZotd+FNu?=
 =?us-ascii?Q?VaA9U2JhKWpje6BN6hWu0FsWHAm7aPj1yRZOrmoF9Ch1t+Ymo2kbzi2jhqH+?=
 =?us-ascii?Q?GBXhpzhk+vVT3Klp66wcwserOnmtTryts1ngcGxXQlY+iJFxteYHuj6Se4oj?=
 =?us-ascii?Q?YbDRTfqomMAa9+0FKSDFHxochlBFzO/YMhQlavuVQ+EZz5u0EXaG/2uF9bqL?=
 =?us-ascii?Q?Qli/M/02nhtEU80XNRtBpG7CqrGCAfWdTVC4auvSjCskTH3+0MTZ4mwO+owt?=
 =?us-ascii?Q?kx1Cl2vOTbyzO6RnYZ7ZSkU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vSTTP0zXzsQUM9+oipyH2RsjBEoVTnaFfzWlWexy6oCt4PXfub565x16NdOt?=
 =?us-ascii?Q?bdtzsSV1H3rjp2Iv09KgyIHXbNVAEU2xn8ArJTEbMnbN/Ve/mAOWP25b8xzR?=
 =?us-ascii?Q?MT5gqU4O59CINvg98xAlcGy3bx4HxXdnw+8W1ROw+wACEYB4dz18PJgidysp?=
 =?us-ascii?Q?LNxsJsUDD80PjvNpcCvq6dZSWbMq7t7nQSfxI4lJPWbP16NaLT7LcNUYxeUz?=
 =?us-ascii?Q?nmP1+MDxWtwdgdndSkgt7CSE1SsFmtzo9U5vCsdL5C1n0UjDIg0/z8NLuKiK?=
 =?us-ascii?Q?gBS9C3/0VdDs0wWMg4IRVD0333OyKp4FMzF5iLc8cDQiFjEl5aKDdjR0/Xlj?=
 =?us-ascii?Q?TdXq/Up229gaXC8BXWk3nQs4+1MHOFdi089cx+HJjgLobEfImuQGATndr3pW?=
 =?us-ascii?Q?Gt87QgnYqcBNtuQvIEI7q3zPWqXrDpFxVLZa39301dnd9Z9a+UdIsTl+usRK?=
 =?us-ascii?Q?OUFQ4qD7WQduwml9EQXXcERT6OV7zk+b4cpcOOD4j4uFmxPPGydVdCUYOdjr?=
 =?us-ascii?Q?k1botwNwnTpS+fmFjyNxNobosb6nVTOMSJVpuIAbeZ3EHWgI9x3tKwd+JGgf?=
 =?us-ascii?Q?fw1/XOIX6YkMr2mVhVgr/PMkObS/804A8y5juhaCR+422VD6XBstr2G4aFdg?=
 =?us-ascii?Q?Zd4E0rAu30jxii/Ygzwgjv+0XjnS7vssxViGs+O/U3wCxoCPpb5iO1O2y8Ha?=
 =?us-ascii?Q?3G2ZUcMBVgiI5WqCsO6Hw3G04bgqUuzuRfuHM5UNyR/cHtLUNJc0z9YL3P4T?=
 =?us-ascii?Q?P1zOAm3QdP+3QXLlcA/FtWva9d5xSBr8j1NXFUv+Sgr0zt3l7j5DMfH4xIFc?=
 =?us-ascii?Q?LH0roGl+5CpdSAoShzif7n3x0xBMZ+CJmFq82VUblyNAc8vnRnN32P2NgRnz?=
 =?us-ascii?Q?mCvtipSIs6QsOAkJXoC5idTW/+GFtIxVcX4XUCI8olCt20JYDDUEuqnoCCRO?=
 =?us-ascii?Q?+1K4anYHhAZQ1POEz97Z5Her8S+QhozHn+11coHFcZv6l0cjevCyZ8B+z/o2?=
 =?us-ascii?Q?KtMB1Vq3lOO51IsvBSqoBl+pzYknJD2Z/Fgk9hqY64Oyqjcw6EtWDu9vST9U?=
 =?us-ascii?Q?nv3aCDIGnBrTj+YmulpyqD5T7WcA81iebqHjJtXL6/KAc+9MTKA+2On9iKyD?=
 =?us-ascii?Q?HBf2ckAA5pBFSXuiB/2kzeE5D8Xfid21Z/YgT9nesuM2+5WjY66JykQdvQpY?=
 =?us-ascii?Q?i6efpLNXLH47A0CSwCrRtICXqT87K/ZmzuXcxOehrx7dHzY11TctVaH224zv?=
 =?us-ascii?Q?L9Biu2ncr0IYU/6Db5QrtZS28iEWAjYIHLDL1v0IEf/2zYaP/EtiCU3XvBUO?=
 =?us-ascii?Q?v+P2U5Dp0/NtCqvl98bkas2SsL4xBVkPIZ0+r/Z10ngw34dFrA9CtVi33/PE?=
 =?us-ascii?Q?agkKTn/OWeYtTMnDlv8OPudFCzKsSqpU6BWERCXg6sM904CeXWCdYmukDwwX?=
 =?us-ascii?Q?ABivCkSzZ0hA2MDFdBVvmnf+oy+0Id5naYmUgCc0/XwMO1LZ2U0Uz0oHQ2Bz?=
 =?us-ascii?Q?9P37hthiogBB+VsRUXJYd69PDSs6OdquUtYlT5fYr6PlYqIjrzHvt8Ezh2zN?=
 =?us-ascii?Q?4Aif2VctuqtM4aaJQe6xPbHwfg3GeEGOk761q0XBx99WITqs+r+6H/e/jmNX?=
 =?us-ascii?Q?pEw1bL4BLtfkX9IPrycD2ULLYAlDb3zjD9FxpP8q+z52iG6n8iS2qNT2s8n8?=
 =?us-ascii?Q?QJMdOs/iAYBWg4h1hdW6yD+q5heqElflgXXd+AA2ZO7im3mV/8cQM5zxuODt?=
 =?us-ascii?Q?mmUZOVpOBDoMlwBTguAvusNUoCjElrviC6SWq6WRDmN2QSHoWhW1tICKjifj?=
x-ms-exchange-antispam-messagedata-1: wu8B9hP/8ws+s/sMyLHztG5hVS40hlblPa8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b48d11e-9dfe-42da-a1a2-08de73827c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 08:55:40.2970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eCwFFN3ySBl2Niir9XZ4RSYP8N8rPvcdxze2KLJHNA7IKQ+5r2oBV8N7lbOFBq/2hbshjRuBjdBGj+MhXsU4ZujUPv9iyuIpDOwbM/b+7BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: 24 February 2026 11:03 AM
> To: igt-dev@lists.freedesktop.org; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_store: Extend test coverag=
e to
> all memory regions
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This change generalizes the test to run on all available memory regions (=
e.g.,
> system and VRAM) in the device, instead of only VRAM. All relevant subtes=
ts
> now iterate over each memory region, improving coverage and validation.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 106 ++++++++++++++++++++++--------------
>  1 file changed, 65 insertions(+), 41 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c in=
dex
> 1acaa5aaa..faf2c7fa8 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -114,7 +114,7 @@ static void persistance_batch(struct data *data,
> uint64_t addr)
>   * Description: Test to verify store dword on all available engines.
>   */
>  static void basic_inst(int fd, int inst_type, struct
> drm_xe_engine_class_instance *eci,
> -		       uint16_t dev_id)
> +		       uint16_t dev_id, uint32_t region)
>  {
>  	struct drm_xe_sync sync[2] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, }, @@ -143,8 +143,7 @@ static void
> basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  	bo_size =3D sizeof(*data);
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
> -	bo =3D xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, eci->gt_id),
> +	bo =3D xe_bo_create(fd, vm, bo_size, region,
>=20
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>=20
>  	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0); @@ -193,7
> +192,7 @@ static void basic_inst(int fd, int inst_type, struct
> drm_xe_engine_class_instanc
>   * @page-sized: page-sized
>   */
>  static void store_cachelines(int fd, struct drm_xe_engine_class_instance=
 *eci,
> -			     unsigned int flags)
> +			     unsigned int flags, uint32_t region)
>  {
>  	struct drm_xe_sync sync[2] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, }, @@ -225,8 +224,7 @@ static void
> store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>  	sync[0].handle =3D syncobj_create(fd, 0);
>=20
>  	for (i =3D 0; i < count; i++) {
> -		bo[i] =3D xe_bo_create(fd, vm, bo_size,
> -				     vram_if_possible(fd, eci->gt_id),
> +		bo[i] =3D xe_bo_create(fd, vm, bo_size, region,
>=20
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		bo_map[i] =3D xe_bo_map(fd, bo[i], bo_size);
>  		dst_offset[i] =3D intel_allocator_alloc_with_strategy(ahnd,
> bo[i], @@ -282,7 +280,7 @@ static void store_cachelines(int fd, struct
> drm_xe_engine_class_instance *eci,
>   * SUBTEST: persistent
>   * Description: Validate MI_PRT_BATCH_BUFFER_START functionality
>   */
> -static void persistent(int fd)
> +static void persistent(int fd, uint32_t region)
>  {
>  	struct drm_xe_sync sync =3D {
>  		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> @@ -309,12 +307,10 @@ static void persistent(int fd)
>  	batch_size =3D xe_bb_size(fd, batch_size);
>=20
>  	engine =3D xe_engine(fd, 1);
> -	sd_batch =3D xe_bo_create(fd, vm, batch_size,
> -			      vram_if_possible(fd, engine->instance.gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	prt_batch =3D xe_bo_create(fd, vm, batch_size,
> -			      vram_if_possible(fd, engine->instance.gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	sd_batch =3D xe_bo_create(fd, vm, batch_size, region,
> +
> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	prt_batch =3D xe_bo_create(fd, vm, batch_size, region,
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>=20
>  	xe_vm_bind_sync(fd, vm, sd_batch, 0, addr, batch_size);
>  	sd_data =3D xe_bo_map(fd, sd_batch, batch_size); @@ -419,7 +415,7
> @@ static void long_shader(int fd, struct drm_xe_engine_class_instance
> *hwe,
>   * Test category: functionality test
>   *
>   */
> -static void mem_transaction_ordering(int fd, size_t bo_size, bool fence)
> +static void mem_transaction_ordering(int fd, size_t bo_size, bool
> +fence, uint32_t region)
>  {
>  	struct drm_xe_engine_class_instance inst =3D {
>  		.engine_class =3D DRM_XE_ENGINE_CLASS_COPY, @@ -456,8
> +452,7 @@ static void mem_transaction_ordering(int fd, size_t bo_size, bo=
ol
> fence)
>  	sync[0].handle =3D syncobj_create(fd, 0);
>=20
>  	for (i =3D 0; i < count; i++) {
> -		bo[i] =3D xe_bo_create_caching(fd, vm, bo_size,
> system_memory(fd), 0,
> -
> DRM_XE_GEM_CPU_CACHING_WC);
> +		bo[i] =3D xe_bo_create_caching(fd, vm, bo_size, region, 0,
> +DRM_XE_GEM_CPU_CACHING_WC);
>  		bo_map[i] =3D xe_bo_map(fd, bo[i], bo_size);
>  		offset[i] =3D intel_allocator_alloc_with_strategy(ahnd, bo[i],
>  								bo_size, 0,
> @@ -493,7 +488,6 @@ static void mem_transaction_ordering(int fd, size_t
> bo_size, bool fence)
>  	}
>  	if (fence)
>  		batch_map[b++] =3D MI_MEM_FENCE | MI_WRITE_FENCE;
> -
>  	batch_map[b++] =3D MI_BATCH_BUFFER_END;
>  	sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
>  	sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL; @@ -538,44 +532,72
> @@ int igt_main()
>  	struct drm_xe_engine_class_instance *hwe;
>  	int fd;
>  	uint16_t dev_id;
> +	uint32_t region;
> +	uint64_t memreg;
>  	struct drm_xe_engine *engine;
>=20
>  	igt_fixture() {
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		xe_device_get(fd);
>  		dev_id =3D intel_get_drm_devid(fd);
> +		memreg =3D all_memory_regions(fd);
>  	}
>=20
> -	igt_subtest("basic-store") {
> -		engine =3D xe_engine(fd, 1);
> -		basic_inst(fd, STORE, &engine->instance, dev_id);
> +	igt_subtest_with_dynamic("basic-store") {
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			igt_dynamic_f("region-%s", xe_region_name(region))
> {
> +				engine =3D xe_engine(fd, 1);
> +				basic_inst(fd, STORE, &engine->instance,
> dev_id, region);
> +			}
> +		}
>  	}
>=20
> -	igt_subtest("basic-cond-batch") {
> -		engine =3D xe_engine(fd, 1);
> -		basic_inst(fd, COND_BATCH, &engine->instance, dev_id);
> +	igt_subtest_with_dynamic("basic-cond-batch") {
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			igt_dynamic_f("region-%s", xe_region_name(region))
> {
> +				engine =3D xe_engine(fd, 1);
> +				basic_inst(fd, COND_BATCH, &engine-
> >instance, dev_id, region);
> +			}
> +		}
>  	}
>=20
>  	igt_subtest_with_dynamic("basic-all") {
> -		xe_for_each_engine(fd, hwe) {
> -			igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d",
> -				      xe_engine_class_string(hwe-
> >engine_class),
> -				      hwe->engine_instance,
> -				      hwe->gt_id);
> -			basic_inst(fd, STORE, hwe, dev_id);
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			xe_for_each_engine(fd, hwe) {
> +				igt_dynamic_f("Engine-%s-Instance-%d-Tile-
> %d-Region-%s",
> +					      xe_engine_class_string(hwe-
> >engine_class),
> +					      hwe->engine_instance,
> +					      hwe->gt_id,
> +					      xe_region_name(region))
> +					basic_inst(fd, STORE, hwe, dev_id,
> region);
> +			}
>  		}
>  	}
>=20
> -	igt_subtest("cachelines")
> -		xe_for_each_engine(fd, hwe)
> -			store_cachelines(fd, hwe, 0);
> +	igt_subtest_with_dynamic("cachelines") {
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			xe_for_each_engine(fd, hwe) {
> +				igt_dynamic_f("region-%s",
> xe_region_name(region))
> +					store_cachelines(fd, hwe, 0, region);
> +			}
> +		}
> +	}
>=20
> -	igt_subtest("page-sized")
> -		xe_for_each_engine(fd, hwe)
> -			store_cachelines(fd, hwe, PAGES);
> +	igt_subtest_with_dynamic("page-sized") {
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			xe_for_each_engine(fd, hwe) {
> +				igt_dynamic_f("region-%s",
> xe_region_name(region))
> +					store_cachelines(fd, hwe, PAGES,
> region);
> +			}
> +		}
> +	}
>=20
> -	igt_subtest("persistent")
> -		persistent(fd);
> +	igt_subtest_with_dynamic("persistent") {
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			igt_dynamic_f("region-%s", xe_region_name(region))
> +				persistent(fd, region);
> +		}
> +	}
>=20
>  	igt_subtest_with_dynamic("long-shader-bb-check") {
>  		struct igt_collection *set;
> @@ -615,10 +637,12 @@ int igt_main()
>  			{ SZ_8M,  "8M" },
>  		};
>=20
> -		for (size_t i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> -			igt_dynamic_f("size-%s", sizes[i].label) {
> -				mem_transaction_ordering(fd, sizes[i].size,
> true);
> -				mem_transaction_ordering(fd, sizes[i].size,
> false);
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			for (size_t i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> +				igt_dynamic_f("region-%s",
> xe_region_name(region)) {
> +					mem_transaction_ordering(fd,
> sizes[i].size, true, region);
> +					mem_transaction_ordering(fd,
> sizes[i].size, false, region);
> +				}
>  			}
>  		}
>  	}
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.34.1

