Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EFAD132A2
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 09:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F34A10E3B4;
	Mon,  4 Nov 2024 09:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSrs3WdJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A1810E3B4
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730711258; x=1762247258;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nlPdgU+HQyArjvSVjAeIIzZCBSjz4oYrgnGXVwocKCA=;
 b=MSrs3WdJqWs8CN+uR0//CeaOnUovLSEnUxwoWr9GD/CEKqqtt3pmnxkj
 0WdVqjV75F1V3No0xbZQFf8j4sQFKUk7kBKj1lY1PhLwRUsc5vljq6Cgk
 k0oZw//etqzGlRpM1CrEoaprJYt0eTDHEMrBL0lqnYcSs990499FzJ/4h
 72T3vAdsTuw8vfhrl2M9iJva3HEJvMOZdb60thIKwpE1fgVlw3+IvPH61
 0IdG3klHR7RPKup7NvUW3cUPEl4o+EefqFBn6b2CMCe4BXtR0szWWfbad
 Qdbz0mY3R7NT+cx0qekj+oh8gNccF+8pRML/ax37M6RBNzMj8XMva817e Q==;
X-CSE-ConnectionGUID: 8IkEc1waRLuYiF8kUi/CRw==
X-CSE-MsgGUID: vSlrQLFnTTCEYtb29kxX+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52959260"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52959260"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 01:07:38 -0800
X-CSE-ConnectionGUID: kom+AAhrREGqH/Xe8Fnyqg==
X-CSE-MsgGUID: QX8LoKY1QCCdDlXAsurmtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="114378209"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 01:07:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 01:07:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 01:07:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 01:07:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivO2jGDug1dGJyUX0ErEKx/R45O6UqJkv7QgCBATaexIYZ4ocy6DU3Xo0yE7YgWDtwdaJH7yixFzBhFHrBpI7kfAr27rp6ZJXtH+GxZEW+pJ6d4ILizI2+AXyJRL4j3dNiuvUavRToSgjF2O4PCT/SZYgK8k51Jn7kXLLSQq7Y5yuCqL9ATV/8y/QD/V38paolgn440Y68GXrxKK53Y6rrDWb9xC37xD8QHMDb+c8yneq7FHwZ+JZucCv6mpyi1uqEbZDEU60P5xWJH9ErH9HbUUT1WlbAIvSzeWPnE0Prodr3jlifO1b3yOFjCzuco9y6ZMY1MTNvUtumcCKa3UUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlPdgU+HQyArjvSVjAeIIzZCBSjz4oYrgnGXVwocKCA=;
 b=Xct8JXhgfo+c4q1h/1SZ+ga+pHs+uLHg4SsHBcUbeYJbbQVxLg+0o3/lMWXhXpYSEKa9IMNi3BVwHpS8YbTdeDzYVjYzCyDkhtHSb7js4H/nXQW7YhsZxx3jLm2c8zU0PhHN/M/XP1i8OTXtaTtNd2AMtVtqN8V7BYtoJO/kPLdDqkoNaMCsF1+7peL+rrEirRElQTSjKbM0ft+lezhxp3rGBZlE79Jlx4gP2DfgDSODWPF51j0SzRCrIbgc4vlhF1RuviW5K8tH0IAOYUADbYdc8OTVkUbxe+Lgkz7YnGkmsGimHHOPj08KQk9XrXwH8PGT3mcvWRn23tBMEaSZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.30; Mon, 4 Nov 2024 09:07:34 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 09:07:34 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/kms_vrr: data->switch modes[LOW_RR_MODE] not
 initialized for lobf test
Thread-Topic: [PATCH i-g-t] tests/kms_vrr: data->switch modes[LOW_RR_MODE] not
 initialized for lobf test
Thread-Index: AQHbK454s3sWz8EfcE6dtWLNRPMV57Km2pwQ
Date: Mon, 4 Nov 2024 09:07:34 +0000
Message-ID: <DM4PR11MB6312F9E60F059D0919EE461090512@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241031121355.3419367-1-jouni.hogander@intel.com>
In-Reply-To: <20241031121355.3419367-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB7903:EE_
x-ms-office365-filtering-correlation-id: 53302f89-2d28-45d4-4d5a-08dcfcb01ec2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dCtQV0M4bEM2S0VOQUVobWpwbm1kT2piSmVRWlpNdFJBVEFjUGIwblo2NWFt?=
 =?utf-8?B?cU5KbkgzMzkzY25aRXpKTFppMVZ4K3FucmY3L0dUSFhiU283SXJEcXZLREV0?=
 =?utf-8?B?YTNKOGp1c0tJSlRuUDB1Z0tBOTJuUG96U2F4eUtsUmJLZFVZalJ5b2s0MGZ5?=
 =?utf-8?B?Z2wxWjIzc1g5ejJpU0Q4SUJyS1JCRmxHaTliODVaQUVxK0ZndkMyZHRhZG54?=
 =?utf-8?B?S3VNL3JBSXoyTTRRcDR6M2VFeEIrV1RjNlNuOFVXb25BeU4wdUxsdkxiMXFT?=
 =?utf-8?B?ZWZreGg0REZUTk1SY21LcFRqb2IrR1dqb0Jxc25BeXczTm1UUmcvWXFSVEFY?=
 =?utf-8?B?aS92QnBRdUFOZDV3V3dOb0czTld5OU9GQWZucGR2MDdraWtGQ0Q5M2syZFFM?=
 =?utf-8?B?WXE0a2hReXd2L1prV3NQVDBGSk03S3V3YnlScjFFNVFKVUNaZUt3cS9xem1W?=
 =?utf-8?B?NHJhRzVOMUxMUVJsMW1KUWpzNUxEbG15Q0xYOVhaRVdNemRwUUF1MGFmN1pJ?=
 =?utf-8?B?YitIRkpXWTVGeWVxYzh4TUh2ZUdxWGFSd3RQNlEyYTh5elRHQ3ZCUDBHWFl2?=
 =?utf-8?B?QjYvaU51RVdWZnNrQTNwUnhQQWEybUpMWUFzdUhuS21aVW92NFdobkhwZjJU?=
 =?utf-8?B?bmI3RjEwU3ZXRmNLcFR2YzlRK1JUdjJrazhSaEpJTmQzS0ZOTnJSUmgvRzlH?=
 =?utf-8?B?NVFwQ1RMRktnbEVuaDRkWW5UMU1ZNEdseWhWV0Fqc0FwZVlsSWxrd2Q1bW15?=
 =?utf-8?B?bU4yNGRDaDhpOXplSTAxMGg4bm55Y1dXb3U5WXhrcXFnTzExU2pLWmpWZWtk?=
 =?utf-8?B?dGlQRVg0c0Q2WkplYmJadkZXcjlDb2xadUM3Zlo3QXRZeXovU2tpcUpqWXFK?=
 =?utf-8?B?VitKemg3ZXhlRldETW1FYUY4WnFvYjFqVGg2RHJIMXcySXY3WEhjb1RjeWIx?=
 =?utf-8?B?RFFpbVRuYUdjUkdqSjVZazlKZXd2K3M3V3N2U05NMXdLajdrbEI3MzQ5dTB1?=
 =?utf-8?B?NjhSMmdQbHBZeXR0VnRkS2srOG9VWFZEMFdSSFBOdWtqUGVTdzViSEdQWWZr?=
 =?utf-8?B?SWRvcjF3OEkzSS9GK0QyblI1YnBhaklQSDhQQTJJY2E2NDdOTEJ0TG9sMWdQ?=
 =?utf-8?B?OFIxbmd5emN4OXFpeEI2UGJlRzBCaGVHNTMzNHJMdUhkOUhxMUVncUpyTjJL?=
 =?utf-8?B?ckZCWEhZU1ZQQkgvVXliWTZHcksvNFlMQlJWMFordVNMS2libTdRUVdXQVdZ?=
 =?utf-8?B?Q0hOS0FNNkRuZllRektBcjNITlk5OC9PK2Jjd1dLUE9UcldyU3BRc3ViTTIx?=
 =?utf-8?B?T2dwdE5IQ1hvMnBnZnFBZ3pydU0ydTIwR01WcGM5T2N0bjZXbjBNZDBJM1Zm?=
 =?utf-8?B?Q29DdG54TlNaeDZjR3RiK0pja3BEK1RxWjJjSldBck1hUUFweDlHNVRGc3N3?=
 =?utf-8?B?b0E1UXVlQWJOall2cGo3NkRZRkVqd2R5WTlyTnJSdmpKMTE0ZGlRQTdRTjhL?=
 =?utf-8?B?VTdqUmdUWjFkcUxNbGVhc1ptYXVsa2Z5clhpdkdXOTJLS09HaHpZc1BwM1NE?=
 =?utf-8?B?TnF2dnN5UnFnQ1B6OXRyTTFMYjVLNVhWK2N4VDA1UnR2Ty9XWU5hQ1dkY2Zy?=
 =?utf-8?B?Z2ZLYVByWTNidG1zNDFtb2VWNHAzU1VjWGxqcTNhUDMvQkZIYmxwRC84TC9R?=
 =?utf-8?B?NmNyckdnS1pIU2JtVXRKQXdqb1VjMU9oYlAxUTRhVG5LeGJYbFBmZ3o0czRC?=
 =?utf-8?B?bFJBQ01Zd05jVm5sR3lEL0Q5ek0wZlphdU9GQTkydmFicWFwKzBvbXVKalBB?=
 =?utf-8?Q?W/bbWFZaxzk3zIJvmxRx7rREha7kgvQGEMZ74=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHVSWTM0T1ZzbEtXYzNKRmJ6cDJsWmI1NEh6ZHVneEhuYmJtOGNvWGNqMVVw?=
 =?utf-8?B?aWFEVWdhVC8vUFQycnp1K0F6cStWcUdhbW51NmdqT25XR05aa0lma3FidHAw?=
 =?utf-8?B?SE1JYVZsNjJmcXYra0RoVG9rRWp4QVE5Q1o2YzZ6bFAyaUlrNFg4eTBKQkwv?=
 =?utf-8?B?ejY5VHJYbXZGc1BkV2FrNzVETGYwR3l1aC9LUmdBenNtTENsYVlPYzVDS3di?=
 =?utf-8?B?WkxxSHZNWFQ3Tk1NVk1OSnloWDN1U0VjbWtQS256WkZ4c0VrZ2hzZk02TFAy?=
 =?utf-8?B?eFpEWHVZcW5veTFZKzdsT04vQndmNm84cytHQS93MElPMDBVVjhYbEs4OU13?=
 =?utf-8?B?K2MrblM4UEYvck9UeFhJVDlERkg5aFNUcG5TWVJFcU1XVTNucVpraC9pRWZK?=
 =?utf-8?B?TmdpTVdWOW9HaHFtNGloM29PMkVMYzhkTE16K1owZVY2TWVpN1ZsS1VhMks3?=
 =?utf-8?B?K0hmTWRmcm85NVpmZU5WQlRhSU0vaHBUTHBtWGEvaWJVdW4xVlNsZE8zQ2xZ?=
 =?utf-8?B?Qk1jRDZRa211YmF0UjVwbTdYMmtJVDc1NzFqMUc1dnRMSGRjSll5Q1RqODB5?=
 =?utf-8?B?R25hWWlxOXl5L3dIYjdQMDNDM1BXNS9FaSsxK0htR1JPM2ZJVWo0cXpiYk1u?=
 =?utf-8?B?N1h2andqTy9vdjJCcms3cFVCYnhjb0F5SFBPRG5kbGRCUDdzM3F1SjNENGh2?=
 =?utf-8?B?Nks5ZGhWV05iTFJReW8zbVFSVGJyaGk0S0NhK0FwMk9wK0FrVEk4R3ppU1Q4?=
 =?utf-8?B?SGtkMFNSMjZnNlA3VGd5bXVqVDMwNE4yT01FaU1BTTNpQ2JNOG42bElINmNY?=
 =?utf-8?B?N2paamhUdmFOYzhldEd0QVl4aEJqU1RRcHkyeTJOeWVUb3lBM0VFQlNBQlUw?=
 =?utf-8?B?aitRWjkyYnpXdXQvZTNaOVJSUTBqbjhNMTdCK0VzcnkvVlNpQlhIeVF3K0Iv?=
 =?utf-8?B?U1ozV2NxbkNRZUVTNEE1WDlkT3RGWFhBQTJRK014elZoQ2JETU9VQkNGTGFN?=
 =?utf-8?B?RVNrL2JCMGV1NTZzdElTaTc2Wm1ZNUV3bHhaTjBQaDc0Y2QzVjVIanQrRzZp?=
 =?utf-8?B?QUFuV2M2L0NCSk5wazByZ1BUdmZzZzJ3RkpwQ0pPUTFJNnVLTG1yT3lKVFZ1?=
 =?utf-8?B?RzFHSkZwdjNQSDI1dk9SR0VKMWNYaXQvR0Q4UERmOEh5c3pUd2IxS3NVL1JE?=
 =?utf-8?B?akZWem9HMDg2RFlRSlphalgzaXJnYW94L1VBRjc1cTBoMi8yQkN4cE1pSVdD?=
 =?utf-8?B?K0VSTkdBSlpwdTA1aGZoYnI4QXVaaSthcmJhSDNhWkxZZm8yN0xEc0tLUEFk?=
 =?utf-8?B?WS9iWmlSVCs0N0NhMDVhVUFnSTdNMEVOTjIyNVFTR0RrNnBQWnNrWnpzMFBN?=
 =?utf-8?B?cGVtK2NOU2p3dTdkeFRieGVUdGQxYUFwT29ZZ1lqOVRGRHhRc3FJMFFVcHpN?=
 =?utf-8?B?Zzg2Q2w0MDBqRVdCZW11YUVMeE9NM01heU5sOElKL2tzVHV4NkVYbTVBVHpa?=
 =?utf-8?B?cUJwbHIwK1dzc2JnMkNnT2tBNm5yL3Vnem1uN3VJK3g2U29sb1cwZ0hDd0tQ?=
 =?utf-8?B?WkZxUkQzTVdWcFJwdXJyNGFOcDI2S1IvRGtVeXN0Y1FDTnRsQytRcUlHLzdu?=
 =?utf-8?B?MFR1Zk12RVYxZitzV3NXU2xQRndrU205TUUvN1loZFBXRXo3SU9tRUIvM0Rz?=
 =?utf-8?B?d2RtVzZKRjdGaVB4eXYrMVhOVmFlTE8rOW4vejhDZWk1UHhubWZYODdDcUMy?=
 =?utf-8?B?N0hjR21HNHVIak5GT0pNZjdxWkE1SE5WNHorazdjTHRjZzI3V2kzbEdRYzRI?=
 =?utf-8?B?dk00Q1NtQkdFaGFiU05NYU1EREZnWEZ1NjJ2WDdqcGRpMU83c3BhdDRsWjNQ?=
 =?utf-8?B?WlRhSVlKUm50aHFzOU9MMDA5bnFXVGJPSGVTcC9tODBpa2pXRElNR08vUlR0?=
 =?utf-8?B?NDdoS003dkE2VnlvU2pLQi9zMXpOc1ExUTB5b3c4dlpNU3JxdnN4S2plQ1dv?=
 =?utf-8?B?VEwxR0pCWWNsQjZ0TjhBVE0vSFNraXdzbG9TdGFoYUN4WWs4NEFybEdrTm5r?=
 =?utf-8?B?aEFLN1E2Q3U4VmdRODR2VVFSL3dMUTViaFBab2xYR3ByVjdqdmIvMDNpTnow?=
 =?utf-8?Q?FAeU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53302f89-2d28-45d4-4d5a-08dcfcb01ec2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 09:07:34.0221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p44Pm5vJaDb3hYFT36loXYoI97rfZQxSsog5W8rkyNMPADR+sECcR9V6HDFQedpVHiCdTvVN41WRtG4zw51D3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
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

TEdUTQ0KDQpSZXZpZXdlZC1ieTogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIb2dhbmRlciwgSm91bmkgPGpvdW5p
LmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMzEsIDIwMjQg
NTo0NCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEIsIEpl
ZXZhbiA8amVldmFuLmJAaW50ZWwuY29tPjsgSG9nYW5kZXIsIEpvdW5pDQo+IDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdF0gdGVzdHMva21zX3Zycjog
ZGF0YS0+c3dpdGNoIG1vZGVzW0xPV19SUl9NT0RFXQ0KPiBub3QgaW5pdGlhbGl6ZWQgZm9yIGxv
YmYgdGVzdA0KPiANCj4gbG9iZiBzdWJ0ZXN0IGlzIHVzaW5nIGRhdGEtPnN3aXRjaF9tb2Rlc1tM
T1dfUlJfTU9ERV0gYnV0IG5vdCBpbml0aWFsaXppbmcNCj4gaXQuIEZpeCB0aGlzIGluIG91dHB1
dF9jb25zdHJhaW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3Vu
aS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMva21zX3Zyci5jIHwgMiArLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvdGVzdHMva21zX3Zyci5jIGIvdGVzdHMva21zX3Zyci5jIGluZGV4IDM2YTIy
ZWViZS4uZDBkYjk1NGZhDQo+IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9rbXNfdnJyLmMNCj4gKysr
IGIvdGVzdHMva21zX3Zyci5jDQo+IEBAIC05MjMsNyArOTIzLDcgQEAgc3RhdGljIGJvb2wgb3V0
cHV0X2NvbnN0cmFpbnQoZGF0YV90ICpkYXRhLA0KPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgdWlu
dDMyX3QgZmxhZ3MNCj4gIAlpZ3Rfb3V0cHV0X292ZXJyaWRlX21vZGUob3V0cHV0LCAmZGF0YS0N
Cj4gPnN3aXRjaF9tb2Rlc1tISUdIX1JSX01PREVdKTsNCj4gDQo+ICAJLyogU2VhcmNoIGZvciBh
IGxvdyByZWZyZXNoIHJhdGUgbW9kZS4gKi8NCj4gLQlpZiAoIShmbGFncyAmIChURVNUX1NFQU1M
RVNTX1ZSUiB8IFRFU1RfU0VBTUxFU1NfRFJSUykpKQ0KPiArCWlmICghKGZsYWdzICYgKFRFU1Rf
U0VBTUxFU1NfVlJSIHwgVEVTVF9TRUFNTEVTU19EUlJTIHwNCj4gK1RFU1RfTElOS19PRkYpKSkN
Cj4gIAkJcmV0dXJuIHRydWU7DQo+IA0KPiAgCWRhdGEtPnN3aXRjaF9tb2Rlc1tMT1dfUlJfTU9E
RV0gPQ0KPiBsb3dfcnJfbW9kZV93aXRoX3NhbWVfcmVzKG91dHB1dCwgZGF0YS0+cmFuZ2UubWlu
KTsNCj4gLS0NCj4gMi4zNC4xDQoNCg==
