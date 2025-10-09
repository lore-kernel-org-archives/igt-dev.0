Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AE7CCD183
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 22:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FCF10EB2F;
	Thu,  9 Oct 2025 22:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/O8NYYZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AA210EB2F
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 22:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760049067; x=1791585067;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0MUw1XV1Bqcl5Y5uhZHDzb5Vh934tZEc338X6k9t4DA=;
 b=M/O8NYYZ03J3xvFJnhkMDLtb1IvmlPaOkXJVt+xIdJWkyok25/5xipYk
 wX8jSeMWC63SDb+MaZVs8IOIX4Qpf3g2pcpsazutBndTJtLq3RL6/n4WQ
 deLrGmJkVxUvl1T08siaiBMgdbsuUeA2ntvm7frqulA0jkLgwxPQRw4cV
 lEW9IBlEu7eDRWOPheHpgMj70NbhAAXitXCmcx3BBJhuB/g0LkVa96LXV
 j8peDvO3/1BN+1NDFKMb6hGoEbjS8+Gt1sGNojgLTyAh5bwqN2iM7TLtB
 J5OTflAwKPQG6HOV3rF3K82PnkfvT5DsOZYba8ojbK3KLyAD1sPTnN4RJ g==;
X-CSE-ConnectionGUID: C41T//xHTvGerW2Z4vx/KQ==
X-CSE-MsgGUID: zYGDGRTUSvmRjZ+eAsw3Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="61476743"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="61476743"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 15:31:06 -0700
X-CSE-ConnectionGUID: UhCIbTUmTAuBWG6BfWXLfA==
X-CSE-MsgGUID: vxllEUnoTV+R9lHM3iiIBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="217926150"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 15:31:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:31:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 15:31:04 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:31:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkUcmTKlxfF3OxFJWhJOysXyEvkP/gB93jsKvV2IKDEp+UCpZsp/U3eAvTgO0suQjheGUQaeUA3uXAubDnM4/9y+03757tumGxQZGtz/Y2BD6sTd43pieKAuWP+t/GWTTnmZhehGtuqmzBXlXD0DfdJEE6m5ruihkwHqKuX5/iiw4RbkB6avNVZ8WeoBj3E58DR8eE0SIvKLQTzEjkRj5oS/HwkA9HzAU+UuRzw3JiM4j9Q3Oya+U+CxVrfSaFj8/HfJeNJT3waLCKUtuDDF+sVRk8XhpAwGieP9X0wF+YV9eiB+XsJBZKCtb07GCqdE26eOToM5RzoSgmWEnxW8Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MUw1XV1Bqcl5Y5uhZHDzb5Vh934tZEc338X6k9t4DA=;
 b=uTi+5CyOhG5nIyYGGPJSWttDFgYvht1bq+dkQ7FbFziOWbJ7EkRuEfyPIRTRolTHa0A8U8EbX48QB3nPFuE3tFhQykjuyyU0UDOu1LXUX6QCzOO4V9aUsiPUP1LaKJDatwb4NbDxGh2waOlsvTyejfRuAGZhxTK/WhEeGuQoSqfLhjcbXNBvPDB9vToiBqp8vKPDSLS0TLCgtrEPkICMHft/uuZIYYawoAgfoU9c9jQYdATSq6G1mnO5GIv0eyEh9SWGHlRWT0GdL7qd0sAqgmsU9G17yFU/+806EePaBQseNbOI5HJxGiFOhxlbHE6ulVwyPg2EfgO7r1Rk4qQ/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 22:30:59 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 22:30:59 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Konieczny, Kamil" <kamil.konieczny@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Nguyen, Brian3" <brian3.nguyen@intel.com>, "Zuo,
 Alex" <alex.zuo@intel.com>, "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>
Subject: RE: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Thread-Topic: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Thread-Index: AQHcOJb96lf1XPb0XEKrmVpgjMaPKLS6BiiAgABcw6A=
Date: Thu, 9 Oct 2025 22:30:59 +0000
Message-ID: <SA3PR11MB804614F081232E1C09EB8B2686EEA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
 <20251008210236.396859-2-x.wang@intel.com>
 <20251009164215.bp2u7feg7452ue3t@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251009164215.bp2u7feg7452ue3t@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|IA1PR11MB6346:EE_
x-ms-office365-filtering-correlation-id: e7c9c307-85b5-4adf-dc83-08de078385a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|42112799006|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZFQ1dzh2dXJiSjFpVU01cDBQMjRvNmRxUFJTcHdlNTJHZGxjZWs0dm1xdTZG?=
 =?utf-8?B?K3VUQlh3VlVjQlV6R1JXOVFjR0ozSDVoeVJUSkpBdENSM3pkVVZOQzdzaEpi?=
 =?utf-8?B?ZVJkM1o1RzBXREZ1OTQ0MzV6eTdnS0JWN3d1ckREVzhIYjdJWG9kVXdWekpj?=
 =?utf-8?B?K0YzanZrKzkzZndBNWRhN3dzTHBOK3hJYjhCelA2RUhxZGFaNk5qcWdIYWJW?=
 =?utf-8?B?emtnQWxEMnNUS05PKzlxWHY4RWtUZzFyRnZFNjBNaXZyWWI0ZFJoNmsveG5T?=
 =?utf-8?B?bmNrNVNRRHFmZENsWVVsUVZSK3lvQWE3dUZ2Z0MyRlR2cTUxbTNUZFV0OWJQ?=
 =?utf-8?B?TDlLU2ZHZjdpWk5rdEJhMUhIQVArR3dJTHZWcmlvVkh1b3VvZWNWRExsZzE5?=
 =?utf-8?B?aDlIbm5qMGpCY1ZOMy9ROVQ2VEorQnJtbDlZNzU5SVhRWUx3RXhVR2dacWlo?=
 =?utf-8?B?Sld4Z2J4YVQ2dEhrT3B0b0Z1YzBvOXdOeGVHWjFrVEE2OTlKVHlMVWtCZUlx?=
 =?utf-8?B?dkJkeXlNNWsyYzdjVEgzL1EvNU1uY0NwZGJpTUg2R3o2UjVMSEZXaG5BeXVj?=
 =?utf-8?B?OGYyUDE3Z1JONXVleFZCYmRDNU1PbE5xeW05aXFDSTQ4T09VQTk4encvV0I2?=
 =?utf-8?B?Z0ZSN0pQSnZndnRNaUZzYUxYekd3VnhlTHpkZllsQWFjUURaNGlYWlBFVXNa?=
 =?utf-8?B?UnpSVWdDK0pLa2RGeTc5bGc1ZFVaZldqaVIwaHppanFab21TSzk4YzNtemp3?=
 =?utf-8?B?ZFZYRnV0bDdrUXgxb1Zwc1R1b3RJdDk0M2Nrbk53RlJaUjI3d2plRzByMGJC?=
 =?utf-8?B?VldsQUZ3SWw5THpSZTZFUVc2YStuM2hpS3FmbUE4SUtPVUZjQmIrR1BBL1Ez?=
 =?utf-8?B?Zmdma2ZvcVlzMk12aGNIbG9pQjhRbHBOR1Rham9LWGx1cUY2Y1VVY0R4ajJk?=
 =?utf-8?B?NkNZVHJHQVRoQy9NWWhQaXBVMStlS3B0MzBxMkViOWhLUjNXb3ZmeHNMNUpz?=
 =?utf-8?B?aEE5bWtmL2ZHN202WlJoTXBKTi9uSkNpcWZqMjdvQXdCdHpLWU5vNjk3cktk?=
 =?utf-8?B?VkpheXk1RzhmbklGRytCK3VTdDRoQjdpZzlnQUhxYVVyUXZ0dGtCNUR5Mm43?=
 =?utf-8?B?bVYxeTVGYjh2WlU2Sm1RRFlLTXNoaG1jYU9iMDBiNS9rUyszb296TGlJcUox?=
 =?utf-8?B?MjlKcWk2Tmd2cmJlVU1sUUJCZk5peUx3d0UzVjJ1Um5ZYUtVcUwxdlJiV0Qv?=
 =?utf-8?B?ZlRGOHBzNkVvODI1UUdMMkJYNERyWEdTMXluY3luZy92K3BpemdYdXZ2dE5t?=
 =?utf-8?B?YnYwcTNIM2RSYjlycHVsdllYV2hNeS85K2hhcUxHdVBmMlRsRXhsaG8welA1?=
 =?utf-8?B?YmJkM29YK21EVlYxcjhYN0plMnAzSnBidFlzSWJ2VjgrYXZSbFA2K1BQODQx?=
 =?utf-8?B?TXN3b0VzRnhwVVpJdEJ3YzdKcXh6eXRyeU05UU12dGN0ck9wSStRUm90b09w?=
 =?utf-8?B?eGNhamExeGsxQVUxbGFKRE0xOFViSGVNcG5lSllBTDY0VkNxYUFnZmJLVnNv?=
 =?utf-8?B?ejZRWE9vcWhycE0xazdkNnFsNWJBU1dGcmNZSW5uR2hua1NKb0xsQXdvYkFx?=
 =?utf-8?B?WVkxUldRYmdqdCttK043N3FyV0Zlb0ErTzJUc2JiNkxLTXpsNWxrbkJmQStn?=
 =?utf-8?B?UitMS1AzdWZSWU5lVmFGUURQZmNoc2FwVGYrREY1WXhmVDFXdk1zWEsrOXhX?=
 =?utf-8?B?bHRmR20xSkZWdWhIeTRSUEpRQkppeXViOXY1TVhXWGhhcDc1TWw3OVd2bkNU?=
 =?utf-8?B?blJnbEZuVHhzVWpHMERmWWVGYUxacHNiNDkxYzNuRGZwKzZlRDF0Z0NzQ0Rr?=
 =?utf-8?B?Q1VIR0hCTFZvUWFPQ3FWSkgxSStneFRoYlhDaHV0UVpwNTI2UHc1U1ZPek9H?=
 =?utf-8?B?R3diU0ZiUzRNUWNqYWpGUjkrSSt1UzIyWjVFanRBamVyMTI1UDMwSnp1S29Y?=
 =?utf-8?B?ekhMS1NpUWF5MVRYZG5oN01lRHNpempJamd1dkNwWEh0N3FFNGR1YzZtdFZI?=
 =?utf-8?Q?ft3m3t?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUhlOFBKczFCc0FoRzM5Y1pJcnNjM0xRdnRiME1HdzRHd1g1VCtKSUdxakpa?=
 =?utf-8?B?ZUI0K01haFlqYmJWS0l2VndWc0lZc2dSdGRObDdxdjNzaWtWUXpSdEl1Nk5a?=
 =?utf-8?B?MmxjZzNjbXJJK0pVakdoWmVIS08vMDh2dXd5Ry9iMThRTktJdlpaYnkzR3Jq?=
 =?utf-8?B?Mko0NkR6WGdCRUFTU3hlVlduZkpkYlk4UzRaUGYvQWhoS20rZDNWc2YxZEFF?=
 =?utf-8?B?dGVhaHVKWk5MT2xvaHRUVEdMOE5YOG5xRC81WlhQcmV5cTBTaWh3emoyRTZT?=
 =?utf-8?B?b3lnV0xrZXByRkp4YVRhd0k0TTZRUmVNSk1PL3IvQTNITFFYZHcrVktCcWJ5?=
 =?utf-8?B?blJHYmNUSjFOTXhmTDdOQVVuR0xJMWp3ank2b2Y1SDUvdnU0cEhtUHQ4RmZp?=
 =?utf-8?B?Q2lVTnhoQUR6RWxwcXZaK0NLdm45dkRoRlU2K1BmellpVEN5NlgrbktwelFk?=
 =?utf-8?B?Tm5FTHJYTmZhTFlKTkQ3dEJJTTNMZkhzWmljNlAvWUVqYUp4THFBT2p1eU5C?=
 =?utf-8?B?WVpWYWZ5SHMxamhFZkl0LzVqYkRSaXVhd2U3Z2UwVzcwL0ovNW9SYkplaG5h?=
 =?utf-8?B?QjdhTnRrbXlueHB1c3F1OWVPUnpGajlpdG81anQ5VUVuVkpycFJLVmkzb2pm?=
 =?utf-8?B?bW1oYmhrZWZVZ3lFL1BqSXVKYk9sTm9DQ2N3bFEyZFo3eTBpOW12OVc3a21s?=
 =?utf-8?B?L25wVTkyTkxsWlAzU0hLa2lhMDdMREhyYXJhd21WblYrUnR1N2EwUFZWSUdt?=
 =?utf-8?B?SWlOVlQzaFJmbmcwcjU1ZGZmL0VPZ2QrU25Ra2l1UDdlbWFqL1BpcmFOSHBN?=
 =?utf-8?B?eDFhV25wdDNZTUg5OVUzQ1VJRVRGbDlOd3g2dDlXN0s4aEtHSFN5VkZuS0lv?=
 =?utf-8?B?RmphaTRnV1pGcGlvVUtVcnh5b20vTURBS01laWo5ZFdOZlBlSDkvQVZQeVdt?=
 =?utf-8?B?N1pBSUhFN2tKbVo1SGU0WHVRYThjblZhQWNrdDBGYWQ4RHkzM3d3WHBhY2FV?=
 =?utf-8?B?RmYybXFkb0paZzM5U0YyQXM4Ni83blJpc0ZWV0RvSWRqWWlPdGRZQU5LeWpz?=
 =?utf-8?B?ano3c3Q4bmdNcS9Ebi9vb0xrQXc5bXozcUNyeW1ZYnMvOEdtZDJGUktWYmhp?=
 =?utf-8?B?ZE1WOE84YjBmaGpGZDdwYzBJcldtSm95cjZBcG5IRisxTGJHQ2NlN3FKZ1I0?=
 =?utf-8?B?aks0bEovWUJ4TXRNbHAyRW03TFJJclYvclM2Q3dWQWU3dzN3bWtzN25sU1BJ?=
 =?utf-8?B?djB6bnBIWTN6UTBxYWVNU0VyVXZFVXk4ODBsQlVVWElCeHJxdytRSTk3dmxD?=
 =?utf-8?B?Zmk5ZWozQXM0SlZSV2U4UkNkaW1aSnY5bEdiSEhZTGhRTVNTSjBtRk5hbk9k?=
 =?utf-8?B?SExncGg0Rk9mYVNHbWVMQzNOSXJkWEtZbURqdGxVTHVCN2dQOUI0T05qdkx6?=
 =?utf-8?B?L3RFK1h0bXRWQ1dmUG13b2IvRUhNSk8wTGFDMHk2OGJjQVZ3a1pXNTN1Q3k0?=
 =?utf-8?B?ck1wblhIamtwR0VabjY0REFTazVpdzRrOFB5SDl1RDdBeUVqWE43ZTVFVXEx?=
 =?utf-8?B?bXUvWVBkSG03SU9uaThDdFA1eVJGR21rWW5ZdTNXUXY0ei83bVd5Q3FHRk1E?=
 =?utf-8?B?MllvN3dBVDhPMUZPd1NUcitxZ0JJZndiSmg1RXJJQzZ0Q3BSVUlmRTl1SENK?=
 =?utf-8?B?R041b0RqaXpIdjBUdmxHbElaTEdQRitmb3VuQWorM0JxRnM4TnZjNm03QlFE?=
 =?utf-8?B?ZTFFcE0xT0VZb29qY1Vza0lnREgyRUl6dmE4a290VDhzQ1h6NDEwZTVHa3Jy?=
 =?utf-8?B?R01SRDk3cnAwd29BTEw2OVhuT1gwdWFOTXkrcXhMWXVhK0pBN1VJa3VQTGNZ?=
 =?utf-8?B?bXBHNmRuU1BCcHM5M0Q5WjlkbHcxdis2amFoazJWRTQwTjlaVlp1QmZBa0RV?=
 =?utf-8?B?T2c2RmZkNDdvWlN5aHdsK01KeWEyMFpxU1FmRm0wVkVTVkJpUDdIcFN3TnUv?=
 =?utf-8?B?SHhhQmxGZ0pOMlYzTDFWcVFnTFFpeW9rMmYxTjE1Q1VSUzJSaVZ1cGxKeTJn?=
 =?utf-8?B?RXBSNjhvdWhNZUcwWFJGWDRKMU5XZy9mejdxNE85YmxSM2RpMkdRWWlUNXAy?=
 =?utf-8?Q?J2w8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c9c307-85b5-4adf-dc83-08de078385a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 22:30:59.7135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +LgSkOb55FibWBFxyM4CZfZDPMUB7dx0bKSFXyVbbqu8axd/BBhGy5e+7k2pDk67bVZlxCNycQ20AOONReh7Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0
b2JlciA5LCAyMDI1IDA5OjQyDQo+IFRvOiBXYW5nLCBYIDx4LndhbmdAaW50ZWwuY29tPg0KPiBD
YzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFJvcGVyLCBNYXR0aGV3IEQNCj4gPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBMaW4sIFNodWljaGVuZyA8c2h1aWNoZW5nLmxpbkBp
bnRlbC5jb20+Ow0KPiBOZ3V5ZW4sIEJyaWFuMyA8YnJpYW4zLm5ndXllbkBpbnRlbC5jb20+OyBa
dW8sIEFsZXgNCj4gPGFsZXguenVvQGludGVsLmNvbT47IEdveWFsLCBOYWtzaHRyYSA8bmFrc2h0
cmEuZ295YWxAaW50ZWwuY29tPjsNCj4gQmhhZGFuZSwgRG55YW5lc2h3YXIgPGRueWFuZXNod2Fy
LmJoYWRhbmVAaW50ZWwuY29tPjsgU291c2EsIEd1c3Rhdm8NCj4gPGd1c3Rhdm8uc291c2FAaW50
ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvNl0gbGliOiBBZGQgcnVudGltZSBk
ZXZpY2UgaW5mbyBxdWVyeSBBUElzIGZvciB4ZQ0KPiBkZXZpY2VzDQoNCkhpIEthbWlsLA0KDQo+
IA0KPiBIaSBYaW4sDQo+IE9uIDIwMjUtMTAtMDggYXQgMjE6MDI6MzEgKzAwMDAsIFhpbiBXYW5n
IHdyb3RlOg0KPiA+IEludHJvZHVjZSBuZXcgQVBJcyB0byBxdWVyeSBkZXZpY2UgaW5mb3JtYXRp
b24gYXQgcnVudGltZSBmb3IgeGUgZGV2aWNlczoNCj4gPiAtIGludGVsX3F1ZXJ5X2dlbihpbnQg
ZmQpOiBHZXQgZ3JhcGhpY3MgZ2VuZXJhdGlvbg0KPiA+IC0gaW50ZWxfcXVlcnlfZ3JhcGhpY3Nf
dmVyKGludCBmZCk6IEdldCBjb21iaW5lZCBncmFwaGljcyB2ZXJzaW9uDQo+ID4gLSBpbnRlbF9x
dWVyeV9kZXZpY2VfaW5mbyhpbnQgZmQpOiBHZXQgZGV2aWNlIGluZm8gc3RydWN0dXJlDQo+ID4N
Cj4gPiBGb3IgeGUgZGV2aWNlcywgZ3JhcGhpY3MgdmVyc2lvbnMgKGJvdGggbWFqb3IgYW5kIG1p
bm9yKSBjYW4gYmUNCj4gPiBhY2N1cmF0ZWx5IGRldGVybWluZWQgYnkgcmV0cmlldmluZyBHTURf
SUQgdmlhIElPQ1RMLCByYXRoZXIgdGhhbg0KPiA+IHJlbHlpbmcgb24gc3RhdGljIGludGVsX2Rl
dmljZV9tYXRjaCB0YWJsZS4gRGlmZmVyZW50IGRldmljZSBpbnN0YW5jZXMNCj4gPiBvZiB0aGUg
c2FtZSB0eXBlIG1heSBoYXZlIGRpZmZlcmVudCBncmFwaGljc19yZWwgKG1pbm9yIHZlcnNpb24p
IHZhbHVlcy4NCj4gPg0KPiA+IEltcGxlbWVudGF0aW9uIGRldGFpbHM6DQo+ID4gLSB4ZV9kZXZp
Y2Ugc3RydWN0IG5vdyBpbmNsdWRlcyBpbnRlbF9kZXZpY2VfaW5mbyBmb3IgY29tcGF0aWJpbGl0
eQ0KPiA+IC0gZ3JhcGhpY3NfcmVsIGlzIHBvcHVsYXRlZCBmcm9tIEdNRF9JRCdzIGlwX3Zlcl9t
aW5vciBhdCBydW50aW1lDQo+ID4gLSBGb3Igbm9uLUdNRF9JRCBwbGF0Zm9ybXMgKGlwX3Zlcl9t
YWpvciA9PSAwKSwgaGFyZGNvZGVkIHZhbHVlcyBhcmUNCj4gPiBwcmVzZXJ2ZWQNCj4gPiAtIE5l
dyBBUElzIGZhbGwgYmFjayB0byB0cmFkaXRpb25hbCBkZXZpZC1iYXNlZCBsb29rdXAgZm9yIGk5
MTUNCj4gPiBkZXZpY2VzDQo+ID4NCj4gPiBUaGlzIGluZnJhc3RydWN0dXJlIGVuYWJsZXMgYWNj
dXJhdGUgZGV2aWNlIGNhcGFiaWxpdHkgZGV0ZWN0aW9uIGFuZA0KPiA+IGF2b2lkcyBpc3N1ZXMg
d2hlbiBhZGRpbmcgbmV3IGRldmljZSBJRHMgd2l0aCB2YXJ5aW5nIGdyYXBoaWNzX3JlbCB2YWx1
ZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaW4gV2FuZyA8eC53YW5nQGludGVsLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgbGliL2ludGVsX2NoaXBzZXQuYyB8IDYzDQo+ID4gKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGxpYi9pbnRlbF9jaGlwc2V0
LmggfCAgMyArKysNCj4gPiAgbGliL3hlL3hlX3F1ZXJ5LmMgICB8IDE5ICsrKysrKysrKysrKysr
DQo+ID4gIGxpYi94ZS94ZV9xdWVyeS5oICAgfCAgMyArKysNCj4gDQo+IFBsZWFzZSBzcGxpdCBp
dCBpbnRvIHR3byBjaGFuZ2VzLCBvbmUgZm9yIFhlLCBvbmUgZm9yIGludGVsX2NoaXBzZXQuDQo+
IA0KT0ssIEkgd2lsbCBzcGxpdCBpdCBpbnRvIHR3byBwYXRjaGVzLg0KDQo+ID4gIDQgZmlsZXMg
Y2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pbnRl
bF9jaGlwc2V0LmMgYi9saWIvaW50ZWxfY2hpcHNldC5jIGluZGV4DQo+ID4gNzYwZmFlZGUyLi44
OTBiMWUzZmEgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2ludGVsX2NoaXBzZXQuYw0KPiA+ICsrKyBi
L2xpYi9pbnRlbF9jaGlwc2V0LmMNCj4gPiBAQCAtMTg5LDMgKzE4OSw2NiBAQCBpbnRlbF9jaGVj
a19wY2godm9pZCkNCj4gPiAgCQlyZXR1cm47DQo+ID4gIAl9DQo+ID4gIH0NCj4gPiArDQo+ID4g
Ky8qKg0KPiA+ICsgKiBpbnRlbF9xdWVyeV9kZXZpY2VfaW5mbzoNCj4gPiArICogQGZkOiBvcGVu
IGk5MTUveGUgZHJtIGZpbGUgZGVzY3JpcHRvcg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zIGRl
dmljZSBpbmZvcm1hdGlvbiBzdHJ1Y3R1cmUgZm9yIGRldmljZSBAZmQuIEZvciBpOTE1DQo+ID4g
K2RldmljZXMsDQo+ID4gKyAqIGZhbGxzIGJhY2sgdG8gaTkxNSBkZXZpY2UgaW5mbyBsb29rdXAu
IFRoaXMgZnVuY3Rpb24gY2FjaGVzIHRoZQ0KPiA+ICtyZXN1bHQNCj4gPiArICogcGVyIGZpbGUg
ZGVzY3JpcHRvciBmb3IgcGVyZm9ybWFuY2UuDQo+ID4gKyAqLw0KPiA+ICtjb25zdCBzdHJ1Y3Qg
aW50ZWxfZGV2aWNlX2luZm8gKmludGVsX3F1ZXJ5X2RldmljZV9pbmZvKGludCBmZCkNCj4gDQo+
IENvdWxkIHlvdSBqdXN0IHJldHVybiBzdHJ1Y3R1cmU/DQoNCldlIG5lZWQgdG8gbWFrZSB0aGUg
Y29tcGF0aWJsZSB3aXRoIHRoZSBpOTE1IHNvIEkgdXNlIHRoZSBzYW1lIHJldHVybiB2YWx1ZSBh
cyBpbnRlbF9nZXRfZGV2aWNlX2luZm8oKS4NCj4gDQo+ID4gK3sNCj4gPiArCXN0YXRpYyBfX3Ro
cmVhZCBpbnQgY2FjaGVkX2ZkID0gLTE7DQo+ID4gKwlzdGF0aWMgX190aHJlYWQgY29uc3Qgc3Ry
dWN0IGludGVsX2RldmljZV9pbmZvICpjYWNoZWRfaW5mbzsNCj4gDQo+IGltaG8gdGhpcyBpcyBi
YWQgaWRlYSB0byBrZWVwIGEgY2FjaGUgaGVyZSwgcmVtb3ZlIGl0Lg0KDQpJIHRoaW5rIHRoZSBj
YWNoZSBoZXJlIGlzIG5lZWRlZC4gSWYgd2UgZG9uJ3QgbWFrZSB0aGUgY2FjaGUsIGV2ZXJ5IGZ1
bmN0aW9uIGNhbGwgd2lsbCBnbyB0aHJvdWdoIHRoZSANCmlzX2k5MTVfZGV2aWNlIC0+IF9faXNf
ZGV2aWNlLT4gX19nZXRfZHJtX2RldmljZV9uYW1lIC0+IGRybUlvY3RsKCkgDQp0aGlzIGlzIHZl
cnkgdGltZSBjb25zdW1pbmcgYW5kIG5vdCBuZWNlc3NhcnkuDQoNCj4gDQo+ID4gKwlzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZV9kZXY7DQo+ID4gKw0KPiA+ICsJaWYgKGNhY2hlZF9mZCA9PSBmZCkNCj4g
PiArCQlnb3RvIG91dDsNCj4gPiArDQo+ID4gKwlpZiAoaXNfaTkxNV9kZXZpY2UoZmQpKSB7DQo+
ID4gKwkJY2FjaGVkX2luZm8gPQ0KPiBpbnRlbF9nZXRfZGV2aWNlX2luZm8oaW50ZWxfZ2V0X2Ry
bV9kZXZpZChmZCkpOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQl4ZV9kZXYgPSB4ZV9kZXZpY2Vf
Z2V0KGZkKTsNCj4gPiArCQlpZiAoIXhlX2RldikNCj4gPiArCQkJcmV0dXJuIE5VTEw7DQo+ID4g
KwkJY2FjaGVkX2luZm8gPSAmeGVfZGV2LT5pbmZvOw0KPiANCj4gWW91IG5lZWQgeGVfZGV2aWNl
X3B1dCgpIGhlcmUuDQoNClRoZSB4ZV9kZXZpY2VfcHV0KCkgd2lsbCBiZSBjYWxsZWQgYWZ0ZXIg
dGhlIHRlc3QgaXMgZG9uZS4gSSB0aGluayB3ZSBzaG91bGRuJ3QgY2FsbCBpdCBoZXJlLCBzaW5j
ZSB3ZSBhcmUgc3RpbGwgdXNpbmcgaXQuDQoNCj4gDQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJY2Fj
aGVkX2ZkID0gZmQ7DQo+ID4gKw0KPiA+ICtvdXQ6DQo+ID4gKwlyZXR1cm4gY2FjaGVkX2luZm87
DQo+ID4gK30NCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBpbnRlbF9xdWVyeV9nZW46DQo+ID4g
KyAqIEBmZDogb3BlbiBpOTE1L3hlIGRybSBmaWxlIGRlc2NyaXB0b3INCj4gPiArICoNCj4gPiAr
ICogUmV0dXJucyBnZW4gSVAgdmVyc2lvbiBmb3IgZGV2aWNlIEBmZC4gRm9yIGk5MTUgZGV2aWNl
cywNCj4gPiArICogZmFsbHMgYmFjayB0byBpOTE1IGdyYXBoaWNzIHZlcnNpb24gbG9va3VwLg0K
PiA+ICsgKi8NCj4gPiArdW5zaWduZWQgaW50ZWxfcXVlcnlfZ2VuKGludCBmZCkNCj4gPiArew0K
PiA+ICsJY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvICppbmZvID0gaW50ZWxfcXVlcnlf
ZGV2aWNlX2luZm8oZmQpOw0KPiA+ICsNCj4gPiArCXJldHVybiBpbmZvID8gaW5mby0+Z3JhcGhp
Y3NfdmVyIDogMDsgfQ0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIGludGVsX3F1ZXJ5X2dyYXBo
aWNzX3ZlcjoNCj4gPiArICogQGZkOiBvcGVuIGk5MTUveGUgZHJtIGZpbGUgZGVzY3JpcHRvcg0K
PiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zIGdyYXBoaWNzIElQIHZlcnNpb24gZm9yIGRldmljZSBA
ZmQuIEZvciBpOTE1IGRldmljZXMsDQo+ID4gKyAqIGZhbGxzIGJhY2sgdG8gaTkxNSBncmFwaGlj
cyB2ZXJzaW9uIGxvb2t1cC4NCj4gPiArICovDQo+ID4gK3Vuc2lnbmVkIGludGVsX3F1ZXJ5X2dy
YXBoaWNzX3ZlcihpbnQgZmQpIHsNCj4gPiArCWNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5m
byAqaW5mbyA9IGludGVsX3F1ZXJ5X2RldmljZV9pbmZvKGZkKTsNCj4gPiArDQo+ID4gKwlpZiAo
IWluZm8pDQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIElQX1ZFUihpbmZv
LT5ncmFwaGljc192ZXIsIGluZm8tPmdyYXBoaWNzX3JlbCk7IH0NCj4gPiBkaWZmIC0tZ2l0IGEv
bGliL2ludGVsX2NoaXBzZXQuaCBiL2xpYi9pbnRlbF9jaGlwc2V0LmggaW5kZXgNCj4gPiAyZjZi
Zjc4OGEuLjhmM2VhMGNlNSAxMDA2NDQNCj4gPiAtLS0gYS9saWIvaW50ZWxfY2hpcHNldC5oDQo+
ID4gKysrIGIvbGliL2ludGVsX2NoaXBzZXQuaA0KPiA+IEBAIC0xMDQsNiArMTA0LDkgQEAgY29u
c3Qgc3RydWN0IGludGVsX2NtZHNfaW5mbw0KPiA+ICppbnRlbF9nZXRfY21kc19pbmZvKHVpbnQx
Nl90IGRldmlkKSBfX2F0dHJpYnV0ZV9fKCAgdW5zaWduZWQNCj4gPiBpbnRlbF9nZW4odWludDE2
X3QgZGV2aWQpIF9fYXR0cmlidXRlX18oKHB1cmUpKTsgIHVuc2lnbmVkDQo+ID4gaW50ZWxfZ3Jh
cGhpY3NfdmVyKHVpbnQxNl90IGRldmlkKSBfX2F0dHJpYnV0ZV9fKChwdXJlKSk7ICB1bnNpZ25l
ZA0KPiA+IGludGVsX2Rpc3BsYXlfdmVyKHVpbnQxNl90IGRldmlkKSBfX2F0dHJpYnV0ZV9fKChw
dXJlKSk7DQo+ID4gK2NvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbyAqaW50ZWxfcXVlcnlf
ZGV2aWNlX2luZm8oaW50IGZkKTsNCj4gPiArdW5zaWduZWQgaW50ZWxfcXVlcnlfZ2VuKGludCBm
ZCk7IHVuc2lnbmVkDQo+ID4gK2ludGVsX3F1ZXJ5X2dyYXBoaWNzX3ZlcihpbnQgZmQpOw0KPiA+
DQo+ID4gIGV4dGVybiBlbnVtIHBjaF90eXBlIGludGVsX3BjaDsNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9saWIveGUveGVfcXVlcnkuYyBiL2xpYi94ZS94ZV9xdWVyeS5jIGluZGV4DQo+ID4gYTg5
ZTBiOTgwLi4zY2FlZWNmMjAgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL3hlL3hlX3F1ZXJ5LmMNCj4g
PiArKysgYi9saWIveGUveGVfcXVlcnkuYw0KPiA+IEBAIC0yMCw2ICsyMCw3IEBADQo+ID4NCj4g
PiAgI2luY2x1ZGUgImRybXRlc3QuaCINCj4gPiAgI2luY2x1ZGUgImlvY3RsX3dyYXBwZXJzLmgi
DQo+ID4gKyNpbmNsdWRlICJpZ3RfY29yZS5oIg0KPiANCj4gV2h5IGlndF9jb3JlIGhlcmU/DQpp
Z3RfYXNzZXJ0IC8gaWd0X2RlYnVnICdzIGRlZmluaXRpb24gYXJlIGluIHRoZSBpZ3RfY29yZS5o
DQo+IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KPg0KUmVnYXJkcywNClhpbg0KIA0KPiA+ICAjaW5j
bHVkZSAiaWd0X21hcC5oIg0KPiA+DQo+ID4gICNpbmNsdWRlICJ4ZV9xdWVyeS5oIg0KPiA+IEBA
IC0zNzUsMTAgKzM3NiwyOCBAQCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZV9kZXZpY2VfZ2V0KGludCBm
ZCkNCj4gPiAgCXhlX2Rldi0+ZGV2X2lkID0geGVfZGV2LT5jb25maWctDQo+ID5pbmZvW0RSTV9Y
RV9RVUVSWV9DT05GSUdfUkVWX0FORF9ERVZJQ0VfSURdICYgMHhmZmZmOw0KPiA+ICAJeGVfZGV2
LT5ndF9saXN0ID0geGVfcXVlcnlfZ3RfbGlzdF9uZXcoZmQpOw0KPiA+DQo+ID4gKwltZW1jcHko
JnhlX2Rldi0+aW5mbywgaW50ZWxfZ2V0X2RldmljZV9pbmZvKHhlX2Rldi0+ZGV2X2lkKSwNCj4g
PiArc2l6ZW9mKHhlX2Rldi0+aW5mbykpOw0KPiA+ICsNCj4gPiAgCS8qIEdUIElEcyBtYXkgYmUg
bm9uLWNvbnNlY3V0aXZlOyBrZWVwIGEgbWFzayBvZiB2YWxpZCBJRHMgKi8NCj4gPiAgCWZvciAo
aW50IGd0ID0gMDsgZ3QgPCB4ZV9kZXYtPmd0X2xpc3QtPm51bV9ndDsgZ3QrKykNCj4gPiAgCQl4
ZV9kZXYtPmd0X21hc2sgfD0gKDF1bGwgPDwgeGVfZGV2LT5ndF9saXN0LQ0KPiA+Z3RfbGlzdFtn
dF0uZ3RfaWQpOw0KPiA+DQo+ID4gKwkvKg0KPiA+ICsJKiBTZXQgZ3JhcGhpY3NfcmVsIGJhc2Vk
IG9uIHRoZSBtYWluIEdUJ3MgaXBfdmVyX21pbm9yLiBXZSBzaG91bGQNCj4gPiArCSogdXNlIHRo
ZSBoYXJkY29kZWQgdmFsdWUgZm9yIHRoZSBub25lIEdNRF9JRCAoaXBfdmVyX21ham9yID09IDAp
DQo+ID4gKwkqIHBsYXRmb3JtcyAoZS5nLiBERzIsQURMLEFUU00pDQo+ID4gKwkqLw0KPiA+ICsJ
Zm9yIChpbnQgZ3QgPSAwOyBndCA8IHhlX2Rldi0+Z3RfbGlzdC0+bnVtX2d0OyBndCsrKQ0KPiA+
ICsJCWlmICh4ZV9kZXYtPmd0X2xpc3QtPmd0X2xpc3RbZ3RdLnR5cGUgPT0NCj4gRFJNX1hFX1FV
RVJZX0dUX1RZUEVfTUFJTiAmJg0KPiA+ICsJCSAgICB4ZV9kZXYtPmd0X2xpc3QtPmd0X2xpc3Rb
Z3RdLmlwX3Zlcl9tYWpvcikgew0KPiA+ICsJCQlpZ3RfZGVidWcoIlNldHRpbmcgZ3JhcGhpY3Nf
dmVyIHRvICV1IGFuZA0KPiBncmFwaGljc19yZWwgdG8gJXVcbiIsDQo+ID4gKwkJCQkgIHhlX2Rl
di0+Z3RfbGlzdC0+Z3RfbGlzdFtndF0uaXBfdmVyX21ham9yLA0KPiA+ICsJCQkJICB4ZV9kZXYt
Pmd0X2xpc3QtPmd0X2xpc3RbZ3RdLmlwX3Zlcl9taW5vcik7DQo+ID4gKwkJCWlndF9hc3NlcnQo
eGVfZGV2LT5pbmZvLmdyYXBoaWNzX3ZlciA9PSB4ZV9kZXYtDQo+ID5ndF9saXN0LT5ndF9saXN0
W2d0XS5pcF92ZXJfbWFqb3IpOw0KPiA+ICsJCQl4ZV9kZXYtPmluZm8uZ3JhcGhpY3NfcmVsID0g
eGVfZGV2LT5ndF9saXN0LQ0KPiA+Z3RfbGlzdFtndF0uaXBfdmVyX21pbm9yOw0KPiA+ICsJCQli
cmVhazsNCj4gPiArCQl9DQo+ID4gKw0KPiA+ICAJLyogVGlsZSBJRHMgbWF5IGJlIG5vbi1jb25z
ZWN1dGl2ZTsga2VlcCBhIG1hc2sgb2YgdmFsaWQgSURzICovDQo+ID4gIAlmb3IgKGludCBndCA9
IDA7IGd0IDwgeGVfZGV2LT5ndF9saXN0LT5udW1fZ3Q7IGd0KyspDQo+ID4gIAkJeGVfZGV2LT50
aWxlX21hc2sgfD0gKDF1bGwgPDwNCj4gPiB4ZV9kZXYtPmd0X2xpc3QtPmd0X2xpc3RbZ3RdLnRp
bGVfaWQpOw0KPiA+IGRpZmYgLS1naXQgYS9saWIveGUveGVfcXVlcnkuaCBiL2xpYi94ZS94ZV9x
dWVyeS5oIGluZGV4DQo+ID4gNzE1YjY0ZTJmLi5lZWZlYjQ3ZGMgMTAwNjQ0DQo+ID4gLS0tIGEv
bGliL3hlL3hlX3F1ZXJ5LmgNCj4gPiArKysgYi9saWIveGUveGVfcXVlcnkuaA0KPiA+IEBAIC03
NCw2ICs3NCw5IEBAIHN0cnVjdCB4ZV9kZXZpY2Ugew0KPiA+DQo+ID4gIAkvKiogQGRldl9pZDog
RGV2aWNlIGlkIG9mIHhlIGRldmljZSAqLw0KPiA+ICAJdWludDE2X3QgZGV2X2lkOw0KPiA+ICsN
Cj4gPiArCS8qKiBAaW5mbzogRGV2aWNlIGluZm9ybWF0aW9uIGZvciBjb21wYXRpYmlsaXR5IHdp
dGggaTkxNSAqLw0KPiA+ICsJc3RydWN0IGludGVsX2RldmljZV9pbmZvIGluZm87DQo+ID4gIH07
DQo+ID4NCj4gPiAgI2RlZmluZSB4ZV9mb3JfZWFjaF9lbmdpbmUoX19mZCwgX19od2UpIFwNCj4g
PiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo=
