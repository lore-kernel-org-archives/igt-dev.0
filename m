Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9048CE7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 12:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516B810E336;
	Fri, 13 Dec 2024 12:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSF6Uw7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85ECE10E336
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 12:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734092137; x=1765628137;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WVXdJW0BkUMJHhqe5LhGXoicCkEBLT+cURe4W97VRio=;
 b=OSF6Uw7lq0tQ8ALbRZd4nUxVkTqfRTz55h2ba4GIgOyMLhKWFFue2HCC
 GlK5TzcsuywYtac8sUwboWCFGvCyZHVw06KiIhJQLkxWK4OYb9yruEiIb
 sU68XJo4p/D/d/LVy4EPHGJuXl9weHFpPq1IuGWo3nsaXKHCdO4PKdrjZ
 0MHoBsSnLo4IQ7kS1Bz6LRKrNhNVBwsDhknhvccdNQmwzHg03ejEOlD9/
 I/UGwPpCrPKy4n5uS86+ang9EVE7hMpqyQKSOF6JSBxyaydOrTlgG5r+R
 +9cCIS0M9SpquK7bVeds9kNg0Sh7IwhAECHNbd8ghIiT3Ux4+V81pBV+j g==;
X-CSE-ConnectionGUID: q9MDeyagSDinzS3ovzvXAA==
X-CSE-MsgGUID: LtfPLWphSACKdTBWnrsSAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="51957881"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="51957881"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:15:36 -0800
X-CSE-ConnectionGUID: eK2lktScTBCdxmebl8tAGQ==
X-CSE-MsgGUID: A1Lj7ufaR3CFwwv5XXtGzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="96291160"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 04:15:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 04:15:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 04:15:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 04:15:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKgkrQ2Kv8rAEeLqg2YldhgYGSk3fP2DGNmKYXPybvKI6zCMwYlo7FHXa0NoiBP3WtEBleC2wdoSWLLCc3UG4AJDus7iiHXrw0iCrywRy2GzPux3lJAYF+b3rnCc/gN8KlcO4noCOFu9eC/jEK1+pnjo47fdCMYGb5LiL4Lps5e0R96DnMDcm3YPC3r9lkGjPE+twJLtB0n530GioszTwbrNYWwjugG/jGGFdcebGa9pfaJ4YS7YfRB6XKcLRsCbQRXdtvzr1wdvWKKI7CB1g+WAkx1jenOGW/B3FNXxxoVZIDj5ac3y4HQcrbzO1MQgVGPq/78d9dVxoaVCa+SN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVXdJW0BkUMJHhqe5LhGXoicCkEBLT+cURe4W97VRio=;
 b=pNumZoKfpKEVufzwTs+0pQ2XPCFeefabzuxIDy35pe+5YEM8nw1E9dgWRdE8w6DZNg1NXRfSIrGt6TDrC3b9xCsXPlmZ4tlqjQjFNJGWxHwF4dJx2SpHseUv/OYfIAg07biZ8XGT+tBJW6UqzKpFz4tgPjppKdkzvJiSjElr7cMkkBqCbct9xpm78JO2FJ/AeG6rmbh+WBxi8iUGYXWsVaU5sd2VJUTg9P2UeyFZQOrZnXfWnMfpAb+sxLgGzqkFxyj4Xes3IwD8Tl0y2eRnr8clWtGMA+tBfbONup7Y94HBeraagv/dbJ4alQnzz0Qiw5FNT3BHhl8E8rzP/sdc9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MN0PR11MB6254.namprd11.prod.outlook.com (2603:10b6:208:3c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 12:15:32 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 12:15:32 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_vm_create: Check negative cases for
 vm_create ioctl
Thread-Topic: [PATCH] tests/intel/xe_vm_create: Check negative cases for
 vm_create ioctl
Thread-Index: AQHbTTUBqikDxFd2hk+pBvxQBzBY57Lj+iOAgAAcgIA=
Date: Fri, 13 Dec 2024 12:15:32 +0000
Message-ID: <BL1PR11MB55256BCD8A5A3FF36BFB732584382@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20241213075724.641859-1-pravalika.gurram@intel.com>
 <b04d46fe-b2db-4fd1-96b2-1ab5a8c991ed@intel.com>
In-Reply-To: <b04d46fe-b2db-4fd1-96b2-1ab5a8c991ed@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MN0PR11MB6254:EE_
x-ms-office365-filtering-correlation-id: 65855041-c1db-41f1-6fd4-08dd1b6fd773
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bS9COXB1WFBEeURYMURsOGhONmorVlE3QVNjK1orUER5dEx2R09rWEEwQUQz?=
 =?utf-8?B?d0pGcTFJUVd3MU1wQlVuSGZIY1BIbzN4VWFZNEZqazFjOE5CdXhjdFVKSDY1?=
 =?utf-8?B?emh1eEdXaXZ5YStPRUVQMFFOWXFJMi9rc2FkMERhUWlXS3BlaXRQZTJaVmVU?=
 =?utf-8?B?SWZscUZCdmNITzd4ZXkzR3VNYk8rVnF5TVdqK005azI0bXdqbzRzc2NrY0R4?=
 =?utf-8?B?d0JYdC95WC9lNWNpVUJrNXF6dkdGclRpK3lCRmpQV1I4NStPclk5NlhrNE5l?=
 =?utf-8?B?R0RoeG1QcUJEdjJSUGFZb2lnVnR5eCsyVWJ3WVhQWTBWQllrNG12blhVaFI5?=
 =?utf-8?B?alMxb2VTb2ZCYUVFZ1dpajgrTDdWTUJQUUJMNXlEOXQ1Q1N4U0JwT0hScDBZ?=
 =?utf-8?B?V3VUdVYxTlJJa1c3Qklsam9kQUpyMGFCSDVrOGF1NzRjWCtCNGVPbnBOd2lh?=
 =?utf-8?B?ckMreWhqY3dUNFZsVUlwWUV6ZFR5Q3hjLzFEQzJQS0hqQ2g2QTZOOTdrVkxU?=
 =?utf-8?B?cVdsWjZPQjdlNGdXUXZSWWUxdEtRQk54c2xKcVpqc0EvVlVZRW5udnVtN05J?=
 =?utf-8?B?R2hKaVZrYUpQU2RmQW0xMFJ4aGM3YjJEYWgwQlJmRVVGSjQraUNWV0xVNzlk?=
 =?utf-8?B?dno4YktNLyt2UENiMXpxV3dhK3o4YlIvUXBJWUVJWFJMQ2V2M0NNSnIxY2lk?=
 =?utf-8?B?Z1Jwc0hGWkpFWGx2MVZRY1NUU2FFaUtvb3A1L1gzSDdpZ091amUyQmlpMWVp?=
 =?utf-8?B?KzBrbjAyS0diaExNdE95MGNvdXA2aUVtVEtiMUNjWU5STFNGN09CbjlpQVNW?=
 =?utf-8?B?eEEvTURoR1ZWUWRXTmY4YUp6a1JxaUtEeHN0NW5CdlI0NkZZbFVEaEJ4Uzkz?=
 =?utf-8?B?Z2puRWRlVU0zaVJlWDNKV2IrL3NGV09FTnZyc2hzZ0dzdCtyd3BuNTBISUVo?=
 =?utf-8?B?RHlIamNOVExKVFVydEpLb3RoalMyRERQenB2K25jR1ExeUVvOFVwdVdnWEpQ?=
 =?utf-8?B?UllaRFBuTzIvNGJ5TlVkcFd2bFB1MlBYZGM2WVJHTjhtK1lFREZrVkVEbkxO?=
 =?utf-8?B?TzBrdDZnUWczSHc5enA5TVkyNkM0VXJWUlJKaStUdXBBTG0xVUYvMUdrbEli?=
 =?utf-8?B?clYxcS9ZR2NVWGN3bDJDWmJJTjVBbFNQUWtNMFJyY1o0R21LZ2NjcmZrRUVD?=
 =?utf-8?B?NXhMdVZUQ1BlQTNTTmRIU1hFRkpGQ0cvOVpLZFVpQ1dPditlbzhiVFIrL0Jl?=
 =?utf-8?B?YVp4NGRrZFZjWWY5c1NJOWlRT1ZVU1VYVzRmUm8vY3VxMEtLYm9FMXV6TkY4?=
 =?utf-8?B?TzdIUm5jZ0tqNWlXaVV4MWwrUmdTc2VKR2pON0NyUnhwOW1DY1BaVkRoY1gx?=
 =?utf-8?B?K3RJUlZaaVR1Ty9HeGd2YjE0YVZNQ1k5alhhaWhMVEd0WkE3MDZuYzIwaDNP?=
 =?utf-8?B?OEV6YjlMdy9BZHlCeXFaOE1VMUhha0RTVFJWdldnYkk3dElPN2NnWXFNQWQ4?=
 =?utf-8?B?UHRENUZKWlQvVlVEQVg0QnNmeHpBYXVHVWdUNUxZaC9qVzdtb3l1d2hQMU9F?=
 =?utf-8?B?ME84RGEycnNST2REeTg3cGxNSnR2c0VaN2U5NnJqQ3hUTDFUckxITXpOQ0R4?=
 =?utf-8?B?cEpQUldDRTMzRi81cHhzb0oxbHkwSnBTR2VEQjdxOGc5UzdzSFpLUjlqMWoz?=
 =?utf-8?B?SXNoWW9EQzRqNEhQOUplaXVqQVV0T0owY3Y2aGU5VmpTQW5LdCtxRldJRU40?=
 =?utf-8?B?RVJZUjVKYVk3VTVrNFBVUk5VeFdDd1hpVmQ4TTZJQnY5WFVGeUNtT3ByN25j?=
 =?utf-8?B?bHU2akNCUHlXODdaZXdJNTBLeU9XN0JLSzhqcXUzRXZsNkJtT2hRTTZZWWc5?=
 =?utf-8?B?SGpGTysvVmRTUDcxQkJUUldqa3NkZkZTci9mNWJRbmVraHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWJUcGh4UDkrb0h0dXNJNU5WMDQwd3VqbjFqWUR3Yk9tUWFpclNNMFdxc2Y4?=
 =?utf-8?B?dXhkbEV3OWNPWDFrWU1aRTMwbUhObW9KZm4vbW9RVkQxR1cyZ0tTK1czSlZX?=
 =?utf-8?B?VlE0bUl4Z2tUdG5qbzJNV3VNbEtzcndKNEVuRlFlbm1ONXlOSVBqcU9oVDlS?=
 =?utf-8?B?aTZCZk80d0tyUVBOY01CWDJML3p3NFp4N25hYTVId0czUVVsTHVueFhDZ3lT?=
 =?utf-8?B?aG9QWW82aFZ5a0JiUmNQOGZSS204TEVGamFIMVp1aTlSZk9YdEVvSkNHeE11?=
 =?utf-8?B?TDBTeEJIN2tzLzNVR1dITHgyWFJxMWM3RzgwbTR5WWhreHZFRlhjMnhiNjQy?=
 =?utf-8?B?UG5FQTRZMUFwWE8zVlMzWHM0Tzhuelc4MWFXbUtUcDl6ZCtjMVBZUFpkSUxV?=
 =?utf-8?B?SWVQdjNXZy9zZ1ZCMU5nUGVtSDlBSDlkQmZVTFhYWGtweUFYTGFZYzFJekpw?=
 =?utf-8?B?QmZYNVNZTHN0bFh3RTEyRzlxV2x5bkRzcmcvUjdIOHkvbDVFZ3lmc3VBcEJQ?=
 =?utf-8?B?RzJ3L0JDTzh1RWJESS9MMWZxOThrbXVCUlFLNzhZSFhZc3FOVUhqWDNGWW5F?=
 =?utf-8?B?VkxPTDYxOTlPMWlOVzZMWXlMaUtSaDkyQXY0QlY3cjFYSmJNd2dISnNOY1ND?=
 =?utf-8?B?MTV6T2x1VUVhaExRVjViSVhBc3h3VTRxN3hIV3V2cGdCMlNGNFphWFd3eFh0?=
 =?utf-8?B?OVZOcWZFRmlEK0JoZWYxREdJbHlMSDRjUmhFMWJVcDlCOTlmQSthVHNpTzlJ?=
 =?utf-8?B?V0J2eXoySWZSdVFxRkVXWXA3dEd4L3NZU0pyR0sxU0JlYndmb3NEQmI3YmZD?=
 =?utf-8?B?R012VVloRTRPTmZkRWgrbGJjVzA2WDE2SmxKWStlV3pIckMvRnVGOFdFZHo5?=
 =?utf-8?B?SjNlTUhISC9HcEhkb1BZbnM1MktmUlVhMXJ5SnRjRzBTaFVpSjQ3WlI0K0NF?=
 =?utf-8?B?UjcwVXo5RWkwTHFxYzAzTkVHeWhJS2kwaVBhQkVJNjJGU000NXdmVUg5blhG?=
 =?utf-8?B?UGNnME16T3JzdW4vN3ZQWVRKY1ZidkFFVWxUcnc3RHZTR1dlNExFNnNvS1pn?=
 =?utf-8?B?WCtJQUxaYkpHMDZITlFwc1V6WFFvcklzcTlDZ0I2Y2xCWFQ4azFUbEtHOXZo?=
 =?utf-8?B?UGdnNlFONkxvNys1cmNJSzFNZ1J4ZmdEb0k1RkNTNGpkTDBVT1NVQkpPM2dO?=
 =?utf-8?B?WnNlKzJicFg4MlB6aHk4d3p1cExtUlRhSjVmNjJBTlNZbzJxaFpXTFhoQnVx?=
 =?utf-8?B?ckRhQVBTK2dTOTdnZnBENlZNcmpXaXZGbWd1blRicU9mWTdPSnl5UEtmM0R2?=
 =?utf-8?B?Tm52ZTJXbHJ3WmZweW5sUzZhY1lRRkg4engxQWYrVEdocWlTLzU0dU9XZ1Jy?=
 =?utf-8?B?UUNSbHMrU2paWE1McnhZSVN6SE1YNDBJK0dsZEhGcThNbTFzNys5Q013Z09X?=
 =?utf-8?B?WE8vQzdob3EzdlMxZjExTEdwQ1d5QkFlZ3hkTjYzamlUYThxOVFZRzBLYmgz?=
 =?utf-8?B?N3d3Yy9EY2NIbm1YTWZWbXAvM1VsWEVia21VbVQ3T05ZYStFa3JJQXg1NytI?=
 =?utf-8?B?QXRWb2pDNFZkQ0tDWk1HL3F6VStHcWJwYzhDc2lYajRWQVJlOGJWOUdvbTIy?=
 =?utf-8?B?SXU2TFJ4OGppOE5JSG9rM1R6TG03MUFnT24ycDVJZVhXNHBvNW9QZTdhMThN?=
 =?utf-8?B?TDJ2dlhIeWI3RkxNM0ZGZTh5TVRGL3pqbmV1L1MySVVhOHZscEU0cmwxU0xi?=
 =?utf-8?B?aFB3Qk50bEtKTzc3QW5pN2JJN1lIZTVWbGFla0JZeHAyTFErbGJDZ2NNZzFC?=
 =?utf-8?B?Z0wvc0hVa25qVkZYVXQrTGo5UWhsY0h2SkZJK25acWZOWUJ2dkJJSTZIdVVj?=
 =?utf-8?B?b0FxOWdHZWVCL1NNVEcyaXhlTlJXT1FVWnFKbGtkM3UwcUo5K1ZFZmVqZWRR?=
 =?utf-8?B?cTJmNEdkcW1lLzBES0JFbFcxZjNNWkVjRHBFVkN4TkRNK0UvWlJ0dlpXbWUr?=
 =?utf-8?B?TGE0RWpSdFFVMjdoS012Uy91cGtpRE1RSndoRldTUHZuMG9CY1ZCMmdSZk1q?=
 =?utf-8?B?OUtmNWR2NUZrWmxLSHVXTThGdXNxTEhZUHdaK09WaUJvcUtZYXFOOWlTWEd3?=
 =?utf-8?B?aXhhd0FUMDNZQWhsVUc1VUJqdFZFMnlTcWRuMzRlelFrSW9McFJOMkNlb3lh?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65855041-c1db-41f1-6fd4-08dd1b6fd773
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 12:15:32.5928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WW/b69mC5KHWyFN92UDY1ymW3fQ5vGbuF486cPqPYNZuJDPFLkIdc2Z32qmPsOHCWiVGs7hk/9onCskZm/2htNXSkSWsIHz7N+/GlAcNyLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6254
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAxMywgMjAy
NCA0OjAyIFBNDQo+IFRvOiBHdXJyYW0sIFByYXZhbGlrYSA8cHJhdmFsaWthLmd1cnJhbUBpbnRl
bC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gdGVzdHMvaW50ZWwveGVfdm1fY3JlYXRlOiBDaGVjayBuZWdhdGl2ZSBjYXNlcyBm
b3INCj4gdm1fY3JlYXRlIGlvY3RsDQo+IA0KPiBPbiAxMy8xMi8yMDI0IDA3OjU3LCBQcmF2YWxp
a2EgR3VycmFtIHdyb3RlOg0KPiA+IE5lZ2F0aXZlIHRlc3QgdG8gY2hlY2sgdm1fY3JlYXRlIGlv
Y3RsIHJldHVybnMgZXhwZWN0ZWQgZXJyb3Igd2hlbg0KPiA+IGludmFsaWQgZmxhZ3MsIGV4dGVu
c2lvbnMsIHJlc2VydmVkICBwYXJhbSBpcyB1c2VkLg0KPiANCj4gV291bGQgYmUgZ29vZCB0byBh
bHNvIGRvIHRoZSBzYW1lIGZvciB0aGUgdm1fZGVzdHJveSBpb2N0bC4gSXQgaGFzIHBhZCBhbmQN
Cj4gcmVzZXJ2ZWQgYWxzbyB3aGljaCBzaG91bGQgYmUgemVybywgcGx1cyB3b3VsZCBiZSBnb29k
IHRvIGFsc28gdHJ5IHRvIGRlc3Ryb3kgYW4NCj4gaW52YWxpZCB2bSBpZC4NCj4gDQoNClRoYW5r
cyBmb3IgcmVwbHkgSSB3aWxsIGFsc28gYWRkIGZvciB2bV9kZXN0cm95IGlvY3RsIHdhaXRpbmcg
Zm9yIGlucHV0IA0KaXMgaXQgb2theSB0byBhZGQgbmV3IGxpYj8gb3Igbm90DQoNCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMvaW50ZWwveGVfdm1fY3JlYXRlLmMgfCAxMDQNCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgdGVzdHMvbWVzb24u
YnVpbGQgICAgICAgICAgfCAgIDEgKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0
aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsL3hlX3ZtX2NyZWF0
ZS5jDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfdm1fY3JlYXRlLmMgYi90
ZXN0cy9pbnRlbC94ZV92bV9jcmVhdGUuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4
IDAwMDAwMDAwMC4uMjQzMGU2NzM5DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL3Rlc3Rz
L2ludGVsL3hlX3ZtX2NyZWF0ZS5jDQo+ID4gQEAgLTAsMCArMSwxMDQgQEANCj4gPiArLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgwqkg
MjAyNCBJbnRlbCBDb3Jwb3JhdGlvbiAgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJpZ3QuaCIN
Cj4gPiArI2luY2x1ZGUgInhlX2RybS5oIg0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIFRFU1Q6
IE5lZ2F0aXZlIHRlc3QgZm9yIHZtIGNyZWF0ZSBpb2N0bA0KPiA+ICsgKiBDYXRlZ29yeTogQ29y
ZQ0KPiA+ICsgKiBNZWdhIGZlYXR1cmU6IEdlbmVyYWwgQ29yZSBmZWF0dXJlcw0KPiA+ICsgKiBT
dWItY2F0ZWdvcnk6IFN5bmNocm9uaXphdGlvbg0KPiA+ICsgKiBGdW5jdGlvbmFsaXR5OiB2bSBj
cmVhdGUNCj4gPiArICogVGVzdCBjYXRlZ29yeTogbmVnYXRpdmUgdGVzdA0KPiA+ICsgKi8NCj4g
PiArDQo+ID4gKy8qKg0KPiA+ICsgKiBTVUJURVNUOiBpbnZhbGlkLWZsYWctJXMNCj4gPiArICog
RGVzY3JpcHRpb246ICBmdW5jdGlvbiAlYXJnWzFdIHVzZWQgaW4gdm0gY3JlYXRlIElPQ1RMIHRv
IG1ha2UgaXQNCj4gPiArZmFpbA0KPiA+ICsgKiBGdW5jdGlvbmFsaXR5OiBmYXVsdA0KPiA+ICsg
Kg0KPiA+ICsgKiBhcmdbMV06DQo+ID4gKyAqIEB4ZV92bV9jcmVhdGVfZmF1bHQ6ICB4ZV92bV9j
cmVhdGVfZmF1bHQNCj4gPiArICogQHhlX3ZtX2NyZWF0ZV9zY3JhY2hfZmF1bHQ6IHhlX3ZtX2Ny
ZWF0ZV9zY3JhY2hfZmF1bHQNCj4gPiArICogQHhlX3ZtX2NyZWF0ZV9zY3JhY2hfZmF1bHRfbHI6
ICAgIHhlX3ZtX2NyZWF0ZV9zY3JhY2hfZmF1bHRfbHINCj4gPiArICovDQo+ID4gKw0KPiA+ICtz
dGF0aWMgdm9pZCBpbnZhbGlkX2ZsYWcoaW50IGZkLCBfX3UzMiBmbGFncykgew0KPiA+ICsJc3Ry
dWN0IGRybV94ZV92bV9jcmVhdGUgY3JlYXRlID0gew0KPiA+ICsJCS5mbGFncyA9IGZsYWdzLA0K
PiA+ICsJfTsNCj4gPiArDQo+ID4gKwlkb19pb2N0bF9lcnIoZmQsIERSTV9JT0NUTF9YRV9WTV9D
UkVBVEUsICZjcmVhdGUsIEVJTlZBTCk7DQo+ID4gKw0KPiA+ICt9DQo+ID4gKw0KPiA+ICsvKioN
Cj4gPiArICogU1VCVEVTVDogaW52YWxpZC1leHRlbnNpb25zDQo+ID4gKyAqIERlc2NyaXB0aW9u
OiBDaGVjayBxdWVyeSB3aXRoIGludmFsaWQgZXh0ZW5zaW9ucyByZXR1cm5zIGV4cGVjdGVkDQo+
ID4gK2Vycm9yIGNvZGUNCj4gPiArICoNCj4gPiArICogU1VCVEVTVDogaW52YWxpZC1yZXNlcnZl
ZA0KPiA+ICsgKiBEZXNjcmlwdGlvbjogQ2hlY2sgcXVlcnkgd2l0aCBpbnZhbGlkIHJlc2VydmVk
IHZhbHVlIHJldHVybnMNCj4gPiArZXhwZWN0ZWQgZXJyb3IgY29kZSAgKi8NCj4gPiArDQo+ID4g
K3N0YXRpYyB2b2lkIGluYXZsaWRfZXh0ZW5zaW9ucyhpbnQgZmQpIHsNCj4gPiArCXN0cnVjdCBk
cm1feGVfdm1fY3JlYXRlIGNyZWF0ZSA9IHsNCj4gPiArCQkuZXh0ZW5zaW9ucyA9IC0xLA0KPiA+
ICsJfTsNCj4gPiArDQo+ID4gKwlkb19pb2N0bF9lcnIoZmQsIERSTV9JT0NUTF9YRV9WTV9DUkVB
VEUsICZjcmVhdGUsIEVJTlZBTCk7DQo+ID4gKw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMg
dm9pZCBpbmF2bGlkX3Jlc2VydmVkKGludCBmZCkNCj4gPiArew0KPiA+ICsJc3RydWN0IGRybV94
ZV92bV9jcmVhdGUgY3JlYXRlID0gew0KPiA+ICsJCS5yZXNlcnZlZFswXSA9IDB4ZmZmZiwNCj4g
PiArCX07DQo+ID4gKw0KPiA+ICsJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVfVk1fQ1JF
QVRFLCAmY3JlYXRlLCBFSU5WQUwpOw0KPiA+ICsNCj4gPiArfQ0KPiA+ICsNCj4gPiAraWd0X21h
aW4NCj4gPiArew0KPiA+ICsJaW50IGZkOw0KPiA+ICsNCj4gPiArCWNvbnN0IHN0cnVjdCBzZWN0
aW9uIHsNCj4gPiArCQljb25zdCBjaGFyICpuYW1lOw0KPiA+ICsJCV9fdTMyIGZsYWdzOw0KPiA+
ICsJfSB2bV9jcmVhdGVfZmxhZ3NfZmFpbF9mdW5jdGlvbnNbXSA9IHsNCj4gPiArCQl7ICJ4ZV92
bV9jcmVhdGVfZmF1bHQiLA0KPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9ERSB9LA0K
PiA+ICsJCXsgInhlX3ZtX2NyZWF0ZV9zY3JhY2hfZmF1bHQiLA0KPiA+ICsJCQlEUk1fWEVfVk1f
Q1JFQVRFX0ZMQUdfU0NSQVRDSF9QQUdFIHwNCj4gPiArCQkJRFJNX1hFX1ZNX0NSRUFURV9GTEFH
X0ZBVUxUX01PREUgfSwNCj4gPiArCQl7ICJ4ZV92bV9jcmVhdGVfc2NyYWNoX2ZhdWx0X2xyIiwN
Cj4gPiArCQkJfihEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSB8DQo+ID4gKwkJCURSTV9Y
RV9WTV9DUkVBVEVfRkxBR19TQ1JBVENIX1BBR0UgfA0KPiA+ICsJCQlEUk1fWEVfVk1fQ1JFQVRF
X0ZMQUdfRkFVTFRfTU9ERSkgfSwNCj4gPiArCQl7IH0NCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJ
aWd0X2ZpeHR1cmUNCj4gPiArCQlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiA+
ICsNCj4gPiArCWZvciAoY29uc3Qgc3RydWN0IHNlY3Rpb24gKnMgPSB2bV9jcmVhdGVfZmxhZ3Nf
ZmFpbF9mdW5jdGlvbnM7IHMtPm5hbWU7DQo+IHMrKykgew0KPiA+ICsJCWlndF9zdWJ0ZXN0X2Yo
ImludmFsaWQtZmxhZy0lcyIsIHMtPm5hbWUpDQo+ID4gKwkJCWludmFsaWRfZmxhZyhmZCwgcy0+
ZmxhZ3MpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlndF9zdWJ0ZXN0KCJpbnZhbGlkLWV4dGVu
c2lvbnMiKQ0KPiA+ICsJCQlpbmF2bGlkX2V4dGVuc2lvbnMoZmQpOw0KPiA+ICsNCj4gPiArCWln
dF9zdWJ0ZXN0KCJpbnZhbGlkLXJlc2VydmVkIikNCj4gPiArCQkJaW5hdmxpZF9yZXNlcnZlZChm
ZCk7DQo+ID4gKw0KPiA+ICsJaWd0X2ZpeHR1cmUgew0KPiA+ICsJCWRybV9jbG9zZV9kcml2ZXIo
ZmQpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArfQ0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9tZXNv
bi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxkIGluZGV4DQo+ID4gMjcyNGM3YTlhLi5mYjlmYzc1
ZDggMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvbWVzb24uYnVpbGQNCj4gPiArKysgYi90ZXN0cy9t
ZXNvbi5idWlsZA0KPiA+IEBAIC0zMjEsNiArMzIxLDcgQEAgaW50ZWxfeGVfcHJvZ3MgPSBbDQo+
ID4gICAJJ3hlX3N5c2ZzX3NjaGVkdWxlcicsDQo+ID4gICAgICAgICAgICd4ZV9zeXNmc190aW1l
c2xpY2VfZHVyYXRpb24nLA0KPiA+ICAgICAgICAgICAneGVfdGxiJywNCj4gPiArICAgICAgICAn
eGVfdm1fY3JlYXRlJywNCj4gPiAgIF0NCj4gPg0KPiA+ICAgaW50ZWxfeGVfZXVkZWJ1Z19wcm9n
cyA9IFsNCg0K
