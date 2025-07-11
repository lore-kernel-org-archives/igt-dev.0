Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37E6C83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 06:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACAD10E261;
	Fri, 11 Jul 2025 06:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2ssm7Pk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9337810E261
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 06:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752214739; x=1783750739;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u9RjOQDOCpHEn5ganf8j0Vipv5pJUP726vXiFiC39kA=;
 b=a2ssm7PkXBj28+7IasZ9aR18MIMi9RUJ0sT7KgL0iRRIPX7MHueNBegc
 2CJtcqw8zCKyavgmZCs/EfHbTJf2/CJvmWgrauajQhIZRCiR0pMD+AoKj
 /hXY4dUAT0Z2xHxWQj+VqaeJiev3U8RBV3lOetzjaBvQkMm+dGdKPc7XJ
 aW/NutJDQr1gJRLCLXOIzAIfithP4YkQFed88ePsNyLy7KPag6EU9PAXX
 6qw+DDbLm816HV9rVlg5wNjBsK3pVfCgVBZCQ+B9zZGi42aGVENloL27G
 zm7xx6p7yE1KhYvx7pxFsIn3TPp9ZPvfufaPjYok8Dt5fLXs7MSoPoJ1V A==;
X-CSE-ConnectionGUID: EUmP7lt+SjGmfCRjCbDokw==
X-CSE-MsgGUID: 1i8WqyLHSKuSMbK4qACLnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="58315929"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="58315929"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 23:18:59 -0700
X-CSE-ConnectionGUID: 8pUZ59zGTmOWBhnxBlTfqQ==
X-CSE-MsgGUID: S3r2z7DKTZOhRKxVQuPzMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="156632672"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 23:18:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 23:18:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 23:18:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.76) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 23:18:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umkfHLN20H6bX4PGkHGgiHrHf1lb0Iv1aETzY1m7wBNqYpfZAyj740nu2Ek8CuRKP+5b2OTzEgZJYPmH68HgyTmHZpelawLcE+H6kLlo/tBABpWzZxNmVXuuawiKlezjaMaZc/Pt+znBZ3SVKbqFe1M491m+X52gUfqf2z4GwAyHUUU9q24T5/hwVgcZK9UuU3N7ExkZ2M4/M9t1XJArdC5GT9aA9gRSB7HnBiq0gOo8JPyFOOLpKl7saaxUpHs7qElIrf7jR81zw2OcI11QFJigf4tFSv3FUtz5sg9W5t7deP970ROVlFfgoPG/iLtlVtcOD6z8Ko34gOWYFzt3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxziJSJMkzYNsiOC9PiAymz3Qy4wmuEpOsoEMS6dVWY=;
 b=qpXeIM+XfoICooyl8qDBQVDVCFiDBNbr4hbWoRz9YL7xvafEDIMFxcCH/c+6deqajZNeoqRKHGBdUNXycuoG+IyN263LSm54eu2EHntgLrq07rKtLjz5YKUeKeU1YlulwG8TXduSRcBLT0MHaQ9R5yEEiJQAMKcsA2yHaIJXEsOcr09Ktv+2AJzihh00oDfY5fbsBFn25sEX0yqnB3gpSGcT2MWCmUEd3CHNqWJ+9tZedtdsez65iFg+kBirHZo4Ypuo4qdDMdfJI3Z1YlVVaqlptokqTiswU1fiats8djueAy+HeJyE9Pfs193ySwGlE479RpMACfPBk4pX626k3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.23; Fri, 11 Jul 2025 06:18:55 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 06:18:55 +0000
Message-ID: <be25da36-ebe6-4adb-b8ff-e736c97c64d4@intel.com>
Date: Fri, 11 Jul 2025 11:48:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/kms_content_protection: Add force HDCP 1.4
 subtest
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
References: <20250709151930.1034205-1-santhosh.reddy.guddati@intel.com>
 <DM3PPF208195D8DBA1E2616EEFE59C898ABE34BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <DM3PPF208195D8DBA1E2616EEFE59C898ABE34BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|MW5PR11MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: 0983ce54-c817-4a3e-60a3-08ddc042cfa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkJLL29KSFJyVlBBZjBOVkdVR3dxSTdrNDlOMEJLUTJpOW9GNjI2dDg2WXl2?=
 =?utf-8?B?aDFFUGNWNlBKbVZHYWJjUXVaNzZpbzNrQzBmdVNUeHlZdW4weHVHOWlFdkpT?=
 =?utf-8?B?VmMrc2d2VGZJUDVnSmpLSWhsYnhxVG50QWFQME1IcytQY3c4dGh6dmJEdW90?=
 =?utf-8?B?S2ZsaTN1cHB1aTlmTlYzbUl0MHlLdTJ5bm1DV2tUQkZmK21GMGtJZWFyd2x6?=
 =?utf-8?B?eVdLclFaSy9ta2YyTFNYVFloa3J2c1J2ZlFOUGw1ZVo2Qm1VMTBrQmRGOUNE?=
 =?utf-8?B?MzdtWFdrVmkyUDRVMTJjUFZER0d6OG9ZYy9QcUxqT2RNTE5kTE54eGV4clhn?=
 =?utf-8?B?eGVOT01sV1FkbVhGdFBWN3g5M0ZSNU9DTFZvMStQUVBLb0ZvWitFK0VXd3RJ?=
 =?utf-8?B?K0lZOXdXL2JiWnh3RVJXZ3JwR1crSGx5eHYxMk9ESXZTNER0bms0czNPTmcz?=
 =?utf-8?B?MWRQSThUcUNMODdHRjJtSWp3Y0dmRElTQzVlc3QvaGlyNHBHMy96RjQzcmp5?=
 =?utf-8?B?d2Y5U3BQM0Y0bDdiVGtxbFZ0V1RxUEI0NDcvT0pTTmt3aERhNXp0c2t3VWxH?=
 =?utf-8?B?U1J1Wm1MTjRXbWF2cHIwUzlFQUxxRXpkZ3BTYk40dmpjMTl3UXBqRGNYR0hO?=
 =?utf-8?B?NEFlRXdZbFdtUGRBOXlCNzdEU0oxMWUwR1VvVlhIL1FJTWliNDZucGZDeGFR?=
 =?utf-8?B?RjgxNWpISUsveVVNMm5rWTZCUTdheEFKOTBOUUI2enNZbG5KVVlWUUE4c1Rk?=
 =?utf-8?B?MzJ6WTdvb1lBdks2Qkp2Q0lXSVU5RyswZ2pqYjVUNWs0MWV4eC9LMDNoMlhT?=
 =?utf-8?B?WFJXR2MwTUtDM2FQd1lmeXhIQk8vUnVjbkxnS3l6WGlmZ1lvR3haalhwWUdt?=
 =?utf-8?B?ZXZTZHJqMHMzb3AwSHQ0dkRVQkZGdFlxZnkzbTYrVjE4OUNDT0xmQ0ZCVUx3?=
 =?utf-8?B?L29IaHF6eUJaUzVNdUV5N29LRmFuUGVpMWJGajdZY0xsMFRTdWpDSWszUlIz?=
 =?utf-8?B?cXlaMWpRKzlHWjM2UHB5N1Bxa29sTU4zRmlRaUNMeG1wQ3diTVd6SmNOd3ZJ?=
 =?utf-8?B?anFKeHRycm9GRW1RU3ZKYmNMU2JYOTFXbWN3eHFMbU5tQzVqeWVCdW9tNTFz?=
 =?utf-8?B?RHlzVnZuUkt6ZmYzN1JZQmp0dC9mN0c4eWpLNUx1UGJDS2cwZ3p6N001OVNI?=
 =?utf-8?B?WHVUdlNKNGNnNDh0djhMSTZxZStUMWNERXdUazdsN2FXSkFrQnB6RHB4L3RP?=
 =?utf-8?B?VllERVdjdnZObi8zWE9kN0ZYUHJmZ1kyUkg3WWFWOEppMU4ydlhNb3RjZGVO?=
 =?utf-8?B?SVZPTGFzYWlTYVhEM085cERHSUdmWjVwSWUwUGVIelJyMkV4NkxBTENRVjhO?=
 =?utf-8?B?K0Y3Yk93UHpQVjA2RlhKWENUZkJiM0Noblk5VENXeXlhcTZ5b0hNQzYvSFFr?=
 =?utf-8?B?alA4SEpscXk4YWpqLzAwdkpXWWJCQ2pNZVlDbmZNc29IRDBWK0o1RTNQSlI0?=
 =?utf-8?B?b2k1bndnVkJXdURHYzhKemRiZnVSOEIrMTZRSXJjS0ZEKzRuRkx1OVBMbmhT?=
 =?utf-8?B?RVZPamovT0hRcmZQRDlCNFM5TVZpcHJUdlRqTlA5OXAzRDdvYmxMZmN5N3ZB?=
 =?utf-8?B?RU54MTRkSUZrcjRWanFneVplMmRxSnhXRUFRbnBGOTBEUHNaU3prNVVMVnFM?=
 =?utf-8?B?RnBtSFRjdDRhVG9zQUxWVjl4WG5JZFQ2MXlsUS84ZGRJdWdjKzZncVc2ekI3?=
 =?utf-8?B?K1VwdDZmdzBzTThGQ1RYenhieE5pOWtqaEk0bEE5WmdsOHpqYmpiNXZDU0NG?=
 =?utf-8?B?YzNYTXl3TVdvRFlTWVZ4SVNCR2UyNTVCS2JnSUt0aEp6cGpZOEhQaDNmUEZX?=
 =?utf-8?B?N0JNTEYzOE5GNmprTFpJL2Z1RGdRWituN0R1aGplYWEzSUlWVk1meTFxcEdq?=
 =?utf-8?Q?6+oaNJKwDV8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlhDWTc1SUNzL0VYR2pJZTErOVN3T2VOM2JCaHc3ZjlLVDZaLy9VYTlvWDdT?=
 =?utf-8?B?aDdldVJBSUpMQUFPdFJNVzJVUk5yV3pJcllpbjRnaUNaNVFJQ21tUllZYytt?=
 =?utf-8?B?ZENBTlZTU1Btay9hZ3JET0h3NkRiYXhHeWQ3UXVUMGhUZ0FFbk9jYStvSlg4?=
 =?utf-8?B?Y3lLU3ZIWlFkZzdOMWppYzhPUVdpb0lmWndld1BOTW8vTG0wbTd4MXV0WUJC?=
 =?utf-8?B?SjRpMTE4ck9RZXFPZm5zTTR6bGxzdFNScHljUDV4Yi90dE5CN1Z1Mmpna0dl?=
 =?utf-8?B?L1RlWFREVDRSd2FIalMyV3lMb1R3ZUd6M1JBMm9wY1ZBWEJ3eGtHb0ZONGQ4?=
 =?utf-8?B?QnNkOE85c1hWK2NQbjYvbW5xNWxRaDhvRzI0TzhVZ0l3UXRMUXdQajJodCtp?=
 =?utf-8?B?OVY0cU9kRmpRNmlSU2lYM3dnRWtYTENhMTVBdnZnVlQ1eXBzRUx3MDFEUGdZ?=
 =?utf-8?B?REplRm5DcHdjWUh4WWhRZWx1Z3FUR2pXVGMzOVo4WUw2bFc0YlNpMlNGN0JV?=
 =?utf-8?B?ZGh4b2ptN0FkYWxmaTdXZTZGcVlEcHNEREJtUlZLV2xlcTlhdTNBcjJGaXds?=
 =?utf-8?B?b2JIQ1FQc212bmRSQkp6TXJrbk1IU1RGQTZJZkFWSEZmdjdLK2xQa0QrY1lh?=
 =?utf-8?B?cXRpUnNlU1Z1QnpLNU1nM0NVcGlvTjk5dlIyMlJCamJHTGYzK2pLdlEybW5H?=
 =?utf-8?B?NGNzYzFqVVpHNGozallrUmxIVnhLSnh6TlVKSlJxMkZrdkJzS3JKYVpMaTNJ?=
 =?utf-8?B?a3RBT2tXZGVKNGpxa0FiaHlXS0hoaHE5azFZcUsxU2JmeG5RNm0xTnFzMUxa?=
 =?utf-8?B?T3JRWXVneFdqRWxpN05hRWRBLy80bDB6cGlYMUEzMmtHRldxV0pTSmgxR3dT?=
 =?utf-8?B?c0E4Vi9IQlhkOG1rT3oyODQyWWNWKzVwa045SzJnZDEyY294K0wweHdnQXR2?=
 =?utf-8?B?TlhlbmU5dWdlS0h1VG5lWEJZTTlISFBwNXBBM0Y1YnhUU3RzVVNYS2c0VFJC?=
 =?utf-8?B?N3VGK2NLd2RjZlNUUnRHWFAvNUFKV0RJUk4rZFZBdVpNZXg4eUd1dzdrdnAv?=
 =?utf-8?B?VStNUVA2N1BuVTlCMVVzK0c5emdpM2tPdVhDSVNNdit6bGwwOVlQUnQ3bkd2?=
 =?utf-8?B?dGtRTmFFajJ0VTd3dlpENDcvdFpORVA0UW9JYTdjTk91anU3UExmREVabkxo?=
 =?utf-8?B?SGpxZ0pHejdqSDM5ZnRBUFFLRzI1VUVWMmZYM2pHVzlzYkczaUZXWWVob3J4?=
 =?utf-8?B?OGJ5OEpIcjRkaGFPWHEzRkRVMWFmTWxJSkpRdEtaQ0YxekVqRnJCekplSEVq?=
 =?utf-8?B?Rm8za1Z6TU5ZSlV4b1RJb1pUUjBqSGE1QXhTaThURXgyWHQxU1E1OGFFT0I2?=
 =?utf-8?B?RkFsNVFsdmZJZTB6OTBtRk1nOTFqdmVVdkVrNitUSVk5TW5BaGtPNzFaeCtC?=
 =?utf-8?B?U0U2NFoyajRrbU5pWGdiMFA0cXEvai9yNzVFazYyNUExTmlGMUkyWVRpVDJ3?=
 =?utf-8?B?MWI5czIzSXRhZ09lT3RKUGZZMnpZa1N1NjZFRDEwOXBJNkEwSjVKK0RkQlVU?=
 =?utf-8?B?amlZclVLQ3lXY1owanRMSXVMT1FEWVViNEVpcmgrdWN4N2RkcVBNczdOZkpq?=
 =?utf-8?B?dWtZbmFhMG9JdkZ0UnllSEg4cFROQmlvQ1UwMHFrU1BwdHk1bVVObVB2SXhS?=
 =?utf-8?B?cHg0ZDJwS1NWeHhLdXBHeFhrWk02UHN5dnZCQ2pVSHpLek10RDRUYVVrMnZF?=
 =?utf-8?B?a2R3cFhYY3NsRWswL1pieEw5RTd2NXdTSG45bENiV1VkQTdJTjBoN2RHUFRS?=
 =?utf-8?B?WUhDSTdDdHBvS1Y5OWRVMnh3L1RUZjBxS0R4RTI1SVVOOE5SbitvRkRyTitT?=
 =?utf-8?B?bDJBRUMzUGQxclE4RlhqeGZESG01UDMzTlZielBXWDB2Z29UN2thdlJsaFVC?=
 =?utf-8?B?WmpOMXB3a3pYRHB2d2JsY25kVS9CU1pSRmpxTTkyb0tDTG5mdzhjV3VuRmlx?=
 =?utf-8?B?NWI5TktXd1VldlRoSW4vTmVsbkF5WTkrUzk0WngzVjd1eE5UTlhHNTlEZTlL?=
 =?utf-8?B?bCt0czZFbU1TeXY1ZnV4b3BraE5NTEk3WThFckxhMVpCaHVzRDlPbUtrK0dl?=
 =?utf-8?B?Y1ZGZHdwU1RLZkkvWnJTQ2l1THk5dmRNNkFYZGtlcUZybm8zZWR1Ti9vdi9V?=
 =?utf-8?Q?L3hUMo1/As/VAbl21ciLUYg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0983ce54-c817-4a3e-60a3-08ddc042cfa3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 06:18:55.1831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0479mjslgpY+MS5u116pJLwY5+JZWxqSPFlougNJuDeqRIC1FxIz1fq6zyKfB0ZyGbeUEwOo1TdBE8oU5cle+FxhB/PzOJmetn193XfdwFRu7WQniy1fp15I5weWWci4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
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



On 11-07-2025 11:21, Kandpal, Suraj wrote:
> 
> 
>> Subject: [PATCH i-g-t v4] tests/kms_content_protection: Add force HDCP 1.4
>> subtest
>>
>> If a Panel supports both HDCP1.4 and HDCP2.2 versions, the kernel will
>> always choose the HDCP2.2 protection path and if this fails, then
>> HDCP1.4 will be tried.
>>
>> The subtest uses debugfs support to force hdcp1.4 on the connector and
>> verify content protection.
>>
>> V2: Use hdcp14 debugfs for all the supported subtests (Suraj).
>>
>> v3: Create new separate subtests for hdcp1.4 and hdcp2.2 for all the
>> supported tests. (Suraj)
>>
>> v4: Add -hdcp14 suffix for subtests only for cases explicitly forcing hdcp1.4,
>> retain original subtest names (eg atomic, type1) for default behaviour. (Suraj)
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_content_protection.c | 154 ++++++++++++++++++++++++++++++---
>>   1 file changed, 142 insertions(+), 12 deletions(-)
>>
>> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
>> index 51fc1d3be..4fa5d2c20 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -43,8 +43,8 @@
>>   #include "igt_panel.h"
>>
>>   /**
>> - * SUBTEST: lic-type-0
>> - * Description: Test for the integrity of link for type-0 content.
>> + * SUBTEST: lic-type-0-hdcp14
>> + * Description: Test for the integrity of link for type-0 content with HDCP1.4.
>>    *
> 
> Why delete the lic-type-0
> Lic-type-0 works with both HDCP 2.2 and HDCP 1.4 this would essentially remove testing for HDCP 2.2 type 0 content
> All you need to do is add not subtraction required
> So the test will be lic-type-0 (no changes here)
> And a new test  lic-type-0-hdcp14 where force_hdcp is true
> Same for all the tests below.
> 

Thanks Suraj for pointing out this. I someone have missed this only 
subtest "lic-type-0" , others is taken care. I will update the patch to 
include this subtest.

> Regards,
> Suraj Kandpal
> 
>>    * SUBTEST: lic-type-1
>>    * Description: Test for the integrity of link for type-1 content.
>> @@ -65,6 +65,11 @@
>>    * Description: Test to detect the HDCP status change when we are reading
>> the
>>    *              uevent sent with the corresponding connector id and property id.
>>    *
>> + * SUBTEST: uevent-hdcp14
>> + * Description: Test to detect the status change when we are reading the
>> + *              uevent sent with the corresponding connector id and property id
>> + *              with HDCP1.4 content protection.
>> + *
>>    * SUBTEST: %s
>>    * Description: Test content protection with %arg[1]
>>    *
>> @@ -74,6 +79,10 @@
>>    * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
>>    * @legacy:         legacy style commit
>>    * @type1:          content type 1 that can be handled only through HDCP2.2.
>> + * @legacy-hdcp14:  Test HDCP1.4 content protection with legacy style
>> commit.
>> + * @atomic-hdcp14:  Test HDCP1.4 content protection with atomic
>> modesetting.
>> + * @atomic-dpms-hdcp14: Test HDCP1.4 content protection with atomic
>> modesetting and DPMS.
>> + *
>>    */
>>
>>   /**
>> @@ -83,8 +92,10 @@
>>    * arg[1]:
>>    *
>>    * @lic-type-0:   Type 0 with LIC
>> + * @lic-type-0-hdcp14: Type 0 with LIC and HDCP1.4
>>    * @lic-type-1:   Type 1 with LIC.
>>    * @type-0:       Type 0
>> + * @type-0-hdcp14: Type 0 with HDCP1.4
>>    * @type-1:       Type 1
>>    */
>>
>> @@ -96,6 +107,7 @@ struct data {
>>   	struct igt_fb red, green;
>>   	unsigned int cp_tests;
>>   	struct udev_monitor *uevent_monitor;
>> +	bool is_force_hdcp14;
>>   } data;
>>
>>   /* Test flags */
>> @@ -581,6 +593,51 @@ static bool output_hdcp_capable(igt_output_t
>> *output, int content_type)
>>   		return true;
>>   }
>>
>> +static void set_i915_force_hdcp14(igt_output_t *output) {
>> +	int fd, ret;
>> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
>> +
>> +	fd = igt_debugfs_connector_dir(data.drm_fd, output->name,
>> O_RDONLY);
>> +	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
>> +
>> +	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
>> sizeof(buf));
>> +	if (ret <= 0) {
>> +		igt_info("i915_force_hdcp14 not supported\n");
>> +		close(fd);
>> +		return;
>> +	}
>> +
>> +	ret = igt_sysfs_write(fd, "i915_force_hdcp14", "1", 2);
>> +	igt_require_f(ret > 0, "i915_force_hdcp14 is not enabled\n");
>> +
>> +	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
>> sizeof(buf));
>> +	igt_assert_f(ret > 0 && strstr(buf, "yes"),
>> +			 "i915_force_hdcp14 is not set to 'yes' on %s
>> debugfs\n",
>> +			 output->name);
>> +
>> +	close(fd);
>> +}
>> +
>> +static void reset_i915_force_hdcp14(igt_output_t *output) {
>> +	int fd, ret;
>> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
>> +
>> +	fd = igt_debugfs_connector_dir(data.drm_fd, output->name,
>> O_RDONLY);
>> +	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
>> +
>> +	ret = igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
>> +	igt_require_f(ret > 0, "i915_force_hdcp14 is not disabled\n");
>> +
>> +	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
>> sizeof(buf));
>> +	igt_assert_f(ret > 0 && strstr(buf, "no"),
>> +			 "i915_force_hdcp14 is not set to 'no' on %s
>> debugfs\n",
>> +			 "i915_force_hdcp14");
>> +
>> +	close(fd);
>> +}
>> +
>>   static void
>>   test_fini(igt_output_t *output, enum igt_commit_style commit_style)  { @@ -
>> 654,10 +711,15 @@ test_content_protection(enum igt_commit_style
>> commit_style, int content_type)
>>   					  output->name);
>>   				continue;
>>   			}
>> +			if (data.is_force_hdcp14)
>> +				set_i915_force_hdcp14(output);
>>
>>   			igt_dynamic_f("pipe-%s-%s",
>> kmstest_pipe_name(pipe), output->name)
>>   				test_content_protection_on_output(output,
>> pipe, commit_style, content_type);
>>
>> +			if (data.is_force_hdcp14)
>> +				reset_i915_force_hdcp14(output);
>> +
>>   			test_fini(output, commit_style);
>>   			/*
>>   			 * Testing a output with a pipe is enough for HDCP
>> @@ -719,6 +781,11 @@ test_mst_cp_enable_with_retry(igt_output_t
>> *hdcp_mst_output[], int valid_outputs
>>   	int retry_orig = retries, count, i;
>>   	bool ret;
>>
>> +	if (data.is_force_hdcp14) {
>> +		for (count = 0; count < valid_outputs; count++)
>> +			set_i915_force_hdcp14(hdcp_mst_output[count]);
>> +	}
>> +
>>   	do {
>>   		if (retry_orig != retries)
>>   			test_mst_cp_disable(hdcp_mst_output,
>> COMMIT_ATOMIC, valid_outputs); @@ -752,6 +819,11 @@
>> test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int
>> valid_outputs
>>   		igt_display_commit2(display, COMMIT_ATOMIC);
>>   	} while (retries && !ret);
>>
>> +	if (data.is_force_hdcp14) {
>> +		for (count = 0; count < valid_outputs; count++)
>> +			reset_i915_force_hdcp14(hdcp_mst_output[count]);
>> +	}
>> +
>>   	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
>> }
>>
>> @@ -878,54 +950,84 @@ static void create_fbs(void)
>>   			    0.f, 1.f, 0.f, &data.green);
>>   }
>>
>> +
>> +
>>   static const struct {
>>   	const char *desc;
>>   	const char *name;
>>   	unsigned int cp_tests;
>>   	bool content_type;
>> +	bool is_force_hdcp14;
>>   } subtests[] = {
>> +	{ .desc = "Test content protection with atomic modesetting with
>> HDCP1.4.",
>> +	  .name = "atomic-hdcp14",
>> +	  .cp_tests = 0,
>> +	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = true,
>> +	},
>>   	{ .desc = "Test content protection with atomic modesetting",
>>   	  .name = "atomic",
>>   	  .cp_tests = 0,
>> -	  .content_type = HDCP_CONTENT_TYPE_0
>> +	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = false,
>>   	},
>> -	{ .desc = "Test content protection with DPMS ON/OFF during atomic
>> modesetting.",
>> +	{ .desc = "Test content protection with DPMS ON/OFF during "
>> +		  "atomic modesetting with HDCP1.4.",
>> +	  .name = "atomic-dpms-hdcp14",
>> +	  .cp_tests = CP_DPMS,
>> +	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = true,
>> +	},
>> +	{ .desc = "Test content protection with DPMS ON/OFF during atomic
>> +modesetting",
>>   	  .name = "atomic-dpms",
>>   	  .cp_tests = CP_DPMS,
>> -	  .content_type = HDCP_CONTENT_TYPE_0
>> +	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = false,
>>   	},
>>   	{ .desc = "Test for the integrity of link with type 0 content.",
>> -	  .name = "lic-type-0",
>> +	  .name = "lic-type-0-hdcp14",
>>   	  .cp_tests = CP_LIC,
>>   	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = true,
>>   	},
>>   	{ .desc = "Test for the integrity of link with type 1 content",
>>   	  .name = "lic-type-1",
>>   	  .cp_tests = CP_LIC,
>>   	  .content_type = HDCP_CONTENT_TYPE_1,
>> +	  .is_force_hdcp14 = false,
>>   	},
>>   	{ .desc = "Test content protection with content type 1 "
>>   		  "that can be handled only through HDCP2.2.",
>>   	  .name = "type1",
>>   	  .cp_tests = 0,
>>   	  .content_type = HDCP_CONTENT_TYPE_1,
>> +	  .is_force_hdcp14 = false,
>>   	},
>>   	{ .desc = "Test the teardown and rebuild of the interface between "
>>   		  "Intel and mei hdcp.",
>>   	  .name = "mei-interface",
>>   	  .cp_tests = CP_MEI_RELOAD,
>>   	  .content_type = HDCP_CONTENT_TYPE_1,
>> +	  .is_force_hdcp14 = false,
>>   	},
>>   	{ .desc = "Test the content type change when the content protection
>> already enabled",
>>   	  .name = "content-type-change",
>>   	  .cp_tests = CP_TYPE_CHANGE,
>>   	  .content_type = HDCP_CONTENT_TYPE_1,
>>   	},
>> -	{ .desc = "Test to detect the HDCP status change when we are reading
>> the uevent "
>> +	{.desc = "Test to detect the HDCP status change when we are reading
>> the uevent "
>>   		  "sent with the corresponding connector id and property id.",
>>   	  .name = "uevent",
>>   	  .cp_tests = CP_UEVENT,
>>   	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = false,
>> +	},
>> +	{ .desc = "Test to detect the HDCP status change when we are reading
>> the uevent "
>> +		  "sent with the corresponding connector id and property id.",
>> +	  .name = "uevent-hdcp14",
>> +	  .cp_tests = CP_UEVENT,
>> +	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = true,
>>   	},
>>   	/*
>>   	 *  Testing the revocation check through SRM needs a HDCP sink with
>> @@ -940,6 +1042,7 @@ static const struct {
>>   	  .name = "srm",
>>   	  .cp_tests = 0,
>>   	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = true,
>>   	},
>>   };
>>
>> @@ -948,26 +1051,43 @@ static const struct {
>>   	const char *name;
>>   	unsigned int cp_tests;
>>   	bool content_type;
>> +	bool is_force_hdcp14;
>>   } mst_subtests[] = {
>> -	{ .desc = "Test Content protection(Type 0) over DP MST.",
>> +	{ .desc = "Test Content protection(Type 0) over DP MST",
>>   	  .name = "dp-mst-type-0",
>>   	  .cp_tests = 0,
>> -	  .content_type = HDCP_CONTENT_TYPE_0
>> +	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = false,
>> +	},
>> +	{ .desc = "Test Content protection(Type 0) over DP MST with
>> HDCP1.4.",
>> +	  .name = "dp-mst-type-0-hdcp14",
>> +	  .cp_tests = 0,
>> +	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = true,
>>   	},
>>   	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
>>   	  .name = "dp-mst-lic-type-0",
>>   	  .cp_tests = CP_LIC,
>> -	  .content_type = HDCP_CONTENT_TYPE_0
>> +	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = false,
>> +	},
>> +	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
>> +	  .name = "dp-mst-lic-type-0-hdcp14",
>> +	  .cp_tests = CP_LIC,
>> +	  .content_type = HDCP_CONTENT_TYPE_0,
>> +	  .is_force_hdcp14 = true,
>>   	},
>>   	{ .desc = "Test Content protection(Type 1) over DP MST.",
>>   	  .name = "dp-mst-type-1",
>>   	  .cp_tests = 0,
>>   	  .content_type = HDCP_CONTENT_TYPE_1,
>> +	  .is_force_hdcp14 = false,
>>   	},
>>   	{ .desc = "Test Content protection(Type 1) over DP MST with LIC.",
>>   	  .name = "dp-mst-lic-type-1",
>>   	  .cp_tests = CP_LIC,
>>   	  .content_type = HDCP_CONTENT_TYPE_1,
>> +	  .is_force_hdcp14 = false,
>>   	},
>>   };
>>
>> @@ -980,12 +1100,20 @@ igt_main
>>   		create_fbs();
>>   	}
>>
>> -	igt_describe("Test content protection with legacy style commit.");
>> -	igt_subtest_with_dynamic("legacy") {
>> +	igt_describe("Test content protection with legacy style commit with
>> HDCP1.4");
>> +	igt_subtest_with_dynamic("legacy-hdcp14") {
>>   		data.cp_tests = 0;
>> +		data.is_force_hdcp14 = true;
>>   		test_content_protection(COMMIT_LEGACY,
>> HDCP_CONTENT_TYPE_0);
>>   	}
>>
>> +	igt_describe("Test content protection with legacy style commit with
>> HDCP2.2");
>> +	igt_subtest_with_dynamic("legacy") {
>> +		data.cp_tests = 0;
>> +		data.is_force_hdcp14 = false;
>> +		test_content_protection(COMMIT_LEGACY,
>> HDCP_CONTENT_TYPE_1);
>> +	}
>> +
>>   	igt_subtest_group {
>>   		igt_fixture
>>   			igt_require(data.display.is_atomic);
>> @@ -995,6 +1123,7 @@ igt_main
>>
>>   			igt_subtest_with_dynamic(subtests[i].name) {
>>   				data.cp_tests = subtests[i].cp_tests;
>> +				data.is_force_hdcp14 =
>> subtests[i].is_force_hdcp14;
>>
>>   				if (!strcmp(subtests[i].name, "srm")) {
>>   					bool ret;
>> @@ -1018,6 +1147,7 @@ igt_main
>>
>>   			igt_subtest(mst_subtests[i].name) {
>>   				data.cp_tests = mst_subtests[i].cp_tests;
>> +				data.is_force_hdcp14 =
>> mst_subtests[i].is_force_hdcp14;
>>
>> 	test_content_protection_mst(mst_subtests[i].content_type);
>>   			}
>>   		}
>> --
>> 2.34.1
> 

