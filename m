Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9884DC369CB
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 07:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3229310E181;
	Tue, 22 Apr 2025 07:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOa7XtjA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63CF10E181
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 07:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745307417; x=1776843417;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4e0byxYMo5ku2d3WOr1LLSXGsLsCekKcrqQGID65kmM=;
 b=nOa7XtjAjg8s5myjmHvRpj7NmmGpgAQNzjtX8sjCJrdzlepjud84Xf/X
 ZVlutxHwz/6HdgPwopKewvBeg6L9xjFlfWe98MWGWnw2wfT9HwguYH2XH
 G99/OuBlB7zOTNoJCN+saHmWvh4jOmclDOqlIdi66qbyAegS29wVMw3O4
 LOEq5cANAonyYxPCjT+G9sKY1ykXpkov1PeJ5aHXjqacE1HbtnUnUSo7K
 Wl8HojTQKkPXNqaYSqQ7MJ5moFQbTLN2xs0rtfIZT4o1Kp1qpbukiVSfM
 jWoJmbwY2S+4POIVj3Ro+fOI17n8ZriXcAoxYhA/8DlfCQbIqGhfODc1T A==;
X-CSE-ConnectionGUID: Grkcx4PARpaNvniVnh5awA==
X-CSE-MsgGUID: 8YOatn1FQmi1trYZz1aQhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="64264526"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="64264526"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 00:36:56 -0700
X-CSE-ConnectionGUID: F4MGoZB8QlaHrTT+z7SBKw==
X-CSE-MsgGUID: 9Z+saBRQROWZDrMrri5FoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="131850263"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 00:36:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 00:36:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 00:36:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 00:36:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysD1AczQ4C0nSqFkc6YrCImx0M1IBQ9/TeKpRtWXkXPymXTuTSzAOQsD2tMRA+Ly+htwjLUZJs9gQCJN7OTRZUGy5PJS+pYnLGDiYFxwAZANuIPJU2Iir7eB020q36heQ+RCLjSxkPFYBTgrcT7GfaioomSvuV3ABtYk3tacSimZexR3rg3wWiI/eemLPj0wsV1MQwKzCMHw0JBg71Y0HAo50rf4HIQ5tYIX48ViAOO8HOJYBlIwILZhQQV4n+rRRi/NnSivWUrRSHwXGZVrtjrM0LtwoRSI1Zf6SooUyb3YVrXMNqLA/V/iSYRUrulu+WAP6on8xu6J0mFyhMr7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=us8BAruhQiDUHbY938WuwCGjO/RGqcoIux0N44/jZM0=;
 b=Z20SOcMg2baTMsXqly3IwgyXA81oiPUfRHA1q1V5oXbqsPi58Kv6uV6BU+eLAMxj5BlR34IvOIJr+d9P+MPjV9VBi4fW18AdwhYLAi9bEmILVfAdst8qUrn5g0XtdB022HR7MoYec2apxkkOlCjVj9t1sH/OD18Ed0yIwRiJDFxhmWA5X1n0/vYbF0r613Pzk7/o+U6gYH1XbxR8vmnaaKHW3r2n5yqRnvCIImQByVxsMiipWAsZ00hfdvGlrDJZ/TQcptQyXIntP6sx9dWVaZKeS4NI2flE9Nnt69Caf6Hb9UGGY+F/a86JnAxOwpreI2CcTN9yBNbagFTk6p/cBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB8862.namprd11.prod.outlook.com (2603:10b6:208:59b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 07:36:39 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 07:36:39 +0000
Message-ID: <6752da5f-316e-4e4e-bd57-c62e69f21b83@intel.com>
Date: Tue, 22 Apr 2025 13:06:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/chamelium/kms_chamelium_color: print
 output name in assert
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Karthik B S
 <karthik.b.s@intel.com>
References: <20250415063742.3026718-1-kunal1.joshi@intel.com>
 <20250415063742.3026718-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250415063742.3026718-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: d00a9a1f-a4ab-4691-dad1-08dd81706b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1oyb0RGSGxEdVhsZncrU21JQUNFdFRieUJsU3FaNkNqV1ZSNXJVc29wbmp1?=
 =?utf-8?B?VFlnZFluRFA5cmRBbXh6ODY0ZlZSV3VFVWV0cDFHRS9lZzAvS0RjcDNOeXBO?=
 =?utf-8?B?RWpQRG1ZNHJhVWU0d25SNnhNU0lyM3U1Y09PV3IrZ0cwUUNvY3A0TzIzV2NU?=
 =?utf-8?B?T1M3OHdhdVRGUHg1eGRiUEZ1YUlPd1ArK1ZRNE5MWEQ3eXIyckZ1bFEzclpO?=
 =?utf-8?B?NmRrZXg5bkdXWERDSW50enhUMVhiMGhiZjdFZTlMUDdCVi9Lem4rY3pLSFdQ?=
 =?utf-8?B?Yk5pOWdpK0p6a0oxOHhiaG5HWE1tN0pJSmdYMUJ2WjArTkpsZTdGWVJjK202?=
 =?utf-8?B?RmdxOWpxNTRXZUw2UjhFZnF2MWpYQ0djejF2aTBtWUtER1Bjck1wb3FkQzVx?=
 =?utf-8?B?dExGcnRpRldJNDI4ZnBWUzlFUWtGbWtQazNzeUgwVmhCUEtYTkIxYS9Lc0pR?=
 =?utf-8?B?RGdMTHpBRTRIaWUyNW0wQkM3OUVvVkJ2bnF4VXIrSGJsUUQ3U2JGZ3hSYWJR?=
 =?utf-8?B?Zm52dnpXeGIyZFdBYTUrWGVhNFpuUERGaXNVVkl5cUNlRDRYNzdQVElUNkhP?=
 =?utf-8?B?S09ob1RyKzVCY3pYWktXK2ZDSFl3d3gvQVlGaEdzaE5CU0pwdUQ5d3pRY2dw?=
 =?utf-8?B?c2dNdmpiL3UwRG43ZjhWVmZTbWJ2cEZCVVJ5Ly9hckZNM2Y1SDEvMXowY1hz?=
 =?utf-8?B?aXc3Q1kxUXQ3VTJEeXpQYXcyL2JieGlURDB2QkdMNElGMFYwdTlsdXBlb2xI?=
 =?utf-8?B?RVRDL3BYZHNLL1JrTks0eFFvbVRNK3JULzNTQ3NqUnVrTmlZYXpZaWNYdVBT?=
 =?utf-8?B?L2hLYnM2MEZCRVpDSHQ2eTU4SVUwYjdTTHJwM1E2TjB3Q3ZwQzdSNzVsOERF?=
 =?utf-8?B?UlhLSGNUT3dHa0NMTTlTTGdENERCbnZQelRDUkc1SW9pZ2JncElqdFU0N1dH?=
 =?utf-8?B?SHRJeHJNdlYzbnA3NHFGYmI2N1hvQjhGR1RLek9xaG5YbXhzN0JndURuTVZV?=
 =?utf-8?B?RVpNMFVOcHcwTXp2U2E0Z2pvbWV0VFA3MUNwODBmZyttZUJxTzRzL2tML1Ft?=
 =?utf-8?B?dlF2UGdGTnJZRko3elJodXdkTk5od3pRSW1aNkJwa2oxZE1ZclhJb0NqN29V?=
 =?utf-8?B?ekJ6d1FEY1RrajAzaGR5dTd6M0dMc3pYWnNVZCtDMlVpVzV0RERCOVB2eCtx?=
 =?utf-8?B?bEZPaGtsb2I4V2pHdXlkRmgxZmxRM2t5MkZYQ3c1azNhQUhuSk9kTEt0V2hD?=
 =?utf-8?B?SnduVVlFMlZXeUhtci9NTjFySnVLYmpWK3U3OEE3Qzg0QmxIbUZQNlZwWUQ1?=
 =?utf-8?B?QWM1NG9IV1RNaVc5NkZZd2RSMTJXbGxhMEdxbWFYMnh5Z1dTVmU2VC9uTEUw?=
 =?utf-8?B?RGRvVFJzOFExOFUrQXIwdlV5TjcydVBQQ0l4RzkvdDJTa045WHlHTmNXQmNh?=
 =?utf-8?B?MkRxVE1HeEtvZjhMN1ZCV3IyVWlLQlhkUmlxVUFBd09INmhRNU9JOWt1bHJx?=
 =?utf-8?B?NDBKNU1vZ1NoZEV6MVlZRVIvNUtzWWZZb0RoUG1uMDBOSTFEU1JZNlNUam13?=
 =?utf-8?B?d0o0VTM3bG9jYjY1MUVkeEtIQVNtMnpOUE00b3BISERXa25WbDY1SjkvSStJ?=
 =?utf-8?B?T3pxT3ZGaUpoMjQ5MFZ5cUM3OGpneHhMeWJDcHl0U3VlNkR1Y01iZk9HUDZ3?=
 =?utf-8?B?VUxrVVlubTRvRUdQT1BRYTBWdFNqTkovdjVWTjJQM2NMQjkvQ3g3VmFRUm4w?=
 =?utf-8?B?VVlZWDh3aXJqS2MvNmdCbnY1UXVhZ0RzbVhQV1hRR0xGZHU0YUIxblRONU5o?=
 =?utf-8?B?cFIrdm8xTE94RXdRVmZyTHRsZVR2NW5TTFFHYWlTSk51T1RONXNXN21aUHFL?=
 =?utf-8?B?TDlrd3N3c0tXbzdPMWNNeCtURnlSOUVqcThLTDV6LzRvOTNHdWF4cXpkZW1Z?=
 =?utf-8?Q?OsrEslNmBbg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWczZ3ZFSzc3TUtUZ2xLVXo1YWswbDNzRlV1eVZ5djFWcXpUdG03S3dzeHRa?=
 =?utf-8?B?NE1TMDRxcHJ3MzQ4dExydWtvTkxtb0dGQ1k5R1BEZlFaMzRFTkU4dGhYazhi?=
 =?utf-8?B?VmdmU21lRUQyUHVvUkcya01oZ2hYd2NWQTF2NVhnUCtVb1Qvd2FZVXFXTi9y?=
 =?utf-8?B?Zk43ZitWSVRzZTZJdlYzK0crSHJJN3NIU2l0bUNiZHAxTHJyaE4ram1xcUsz?=
 =?utf-8?B?bmxFWVJIMTRuYi9keFNiVHRWcHRDbGp2R1pyT05ES2drbkZRS3UyL3htZ1dG?=
 =?utf-8?B?RWdHYUU3SC9vVlVSTE84OThXa3ZqcVVmaUJhSnF2NmFBWXUweGNXTXpNMmNo?=
 =?utf-8?B?RysydnYwTThtOWVCS0NPa2p0aTJab1NYdHlQR2JmRlU5VVZxaG95YXBiTkw2?=
 =?utf-8?B?SjNmWGRURjRxcm9OSGFVeWl3bE80ZkRZY2E5OEhHWngxU3RhSk5zYUtrNUpp?=
 =?utf-8?B?R3g1eGhRMGJodkNOWEV6cmtWYkNVRGhsSlFEeHRQaXl6cG04YWx5VzF4ZFRn?=
 =?utf-8?B?cWxoY0x0WmxVQU8wS04wYjFsK1ZyenVBdEJsMTcwbXp1WHIwSVQvbXozVHB5?=
 =?utf-8?B?aHNqbE8xYk9ocGF1dTU5S1hHcktkQVdJd29UK3hGaWhvZWFxckxGZjdwZVlk?=
 =?utf-8?B?czBPamtpUHE2UnVrcVp2aTlleGd3cFQxb1ZQN3p0TUZIWDhGMG9LRDVrWDlw?=
 =?utf-8?B?K0F3eEg0TzZOcWdFUWlpcDU4c3RLeEVQWFVKdFlrOVIwVktDZ1k0UWdRYzEv?=
 =?utf-8?B?NTFWMWJteWRlaHVyY0xnbExFQ1lPRjgyRHluNzJmbFpuK1VJV1QvQzB0UlJh?=
 =?utf-8?B?YW1WRWFlU3EzVnBHczljK0p2cGJkWDd0UE9TWU1XbUprYmk5SXdMT0Y0dUFa?=
 =?utf-8?B?MEpYeVdwbUJxSWp4clR2eVN4RnJkMWpWbCsrajA0VlJCQ2pYekxsMHh3Z3Vr?=
 =?utf-8?B?dXhZRDVVRVdVeThQV1o5eXR3RzA3aHpjdkdpOTFGbUlsZ1p4a0orckU4QTZu?=
 =?utf-8?B?RjBZRHlob29qcVA2Q2p6Y2paTGhQd0hSdklNVlU1MDZDSHpOR0dReFNiNDlK?=
 =?utf-8?B?YkdUdjJMQVpFeEpZNDB6Q0RHNmNrUDNXUG1oVXlueTNGaFBnbGxGWm92eExk?=
 =?utf-8?B?a052ak1OelhtNlBLMkJOaWdQU0kxcmlzaHBXampDM204YkVrc1VIeVlDWUhP?=
 =?utf-8?B?OXM4WFJlM2hReElwSnBvblp4djI2MkhiMVdUSkZzckRmaWVld0xKQTZ3WjUx?=
 =?utf-8?B?Y0l2d0N3UncrQnA1ZUgyOTFOTW1OQ054cVF5QjRCYTZsWTExUVN4V0dMUTNJ?=
 =?utf-8?B?RDVJaUh1dnVJVi95cDByMWtrRTgzVllmQ3BJSGQyKzlNUkIvY2l3QzBQVVMr?=
 =?utf-8?B?cGREeU9HM1dseG5oc3NoWk5GNVRLSEg5RnhTZEVOSkpQOUR2R0FwOUhzcFMx?=
 =?utf-8?B?M1ZiN2pFdnRIVTVydm82UHhPUWFQbmRzb0xVRUVHdWVIZDUrRUdsMThIZ1Nv?=
 =?utf-8?B?SzRySGVqbTNkWWNoV29YeWxaSk13eU9wMkpmVFppdkVjRHZMWDhPZElyNXV5?=
 =?utf-8?B?WVpOemxEWjArcE1ZenQ1Vld1VTdJVU1seDVrK2dRQWJudUh0RkNqWnd1bGoy?=
 =?utf-8?B?eVYzQkNDZlpNTG00dmxzc0VTa0hoOTg1MCtnVDlURG16c3FKNFhsOVpZR0xO?=
 =?utf-8?B?bEJnZGo3WENXSDZmeGU2ZFU3VHRoK2xKZ0JRRHJuNnBYVkdrKzUxenYwR2w0?=
 =?utf-8?B?Z3ZNRE53UHljd1NkU0gzR1JIaGRCYy9JNmtVWEo5cy9xSXlJMHdFNCs5V2hC?=
 =?utf-8?B?M244dmhpeEd3OUQwV1JkclIzTmU5aGhPSW1UV25LbDhNQW85UzUxcUdGNWN5?=
 =?utf-8?B?M0t4bkR4TDlzOGQ5NS9JTlVuVVBGcDYvaGZCbUxnK2pkZ0prcUxNSnZzVHly?=
 =?utf-8?B?U1FDQXR1UExrZGkxVzZ3TmViYTdyUHQ1cWhvWDZxTHRURk9VYVAyam9zektC?=
 =?utf-8?B?aHhyam5SWW0wNWpJby9YeDd1QktETHdzMDhPL0dIU0tGT1FJbGtOanh4SGsy?=
 =?utf-8?B?Zk4zKzNMbTJnS1BpYldlTm9qRGs1RDR3UFlMV2htWTN3Y3czWFVJakVJN2NZ?=
 =?utf-8?B?WEhqbk5EeGtaZXhCYWM0NFJtZVNlQ01hYWpLRFd0TnhGbE1ZcTBJVWNjbGZ2?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d00a9a1f-a4ab-4691-dad1-08dd81706b39
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:36:39.5070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgUz9amFVfuvhQcnyMe3XKFQrYxI2v3+QQxtJstBGXpGYSyrQBmutNgxFejZYdS6Lobzmv+PD6B1oH1igeThnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8862
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

Hi Kunal

Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 15-04-2025 12:07 pm, Kunal Joshi wrote:
> Print output name in assert
>
> v2: print output name for better log readability (Swati)
>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_chamelium.c                   | 62 --------------------------
>   lib/igt_chamelium.h                   | 64 ++++++++++++++++++++++++---
>   lib/intel_compute.c                   |  2 +
>   tests/chamelium/kms_chamelium_color.c |  2 +-
>   4 files changed, 61 insertions(+), 69 deletions(-)
>
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index a96e36b5b..87ac1a1ca 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -24,28 +24,7 @@
>    *  Lyude Paul <lyude@redhat.com>
>    */
>   
> -#include "config.h"
> -
> -#include <stdbool.h>
> -#include <string.h>
> -#include <errno.h>
> -#include <math.h>
> -#include <xmlrpc-c/base.h>
> -#include <xmlrpc-c/client.h>
> -#include <pthread.h>
> -#include <glib.h>
> -#include <pixman.h>
> -#include <cairo.h>
> -
>   #include "igt_chamelium.h"
> -#include "igt_core.h"
> -#include "igt_aux.h"
> -#include "igt_edid.h"
> -#include "igt_frame.h"
> -#include "igt_list.h"
> -#include "igt_kms.h"
> -#include "igt_pipe_crc.h"
> -#include "igt_rc.h"
>   
>   /**
>    * SECTION:igt_chamelium
> @@ -90,47 +69,6 @@
>    * Especially with modern, more complex hardware where we may have LSPcons and
>    * USB controllers in the way.
>    */
> -#define CHAMELIUM_HOTPLUG_DETECTION_DELAY 10
> -
> -struct chamelium_port {
> -	unsigned int type;
> -	int id;
> -	int connector_id;
> -	char *name;
> -	bool adapter_allowed;
> -	char *connector_path;
> -	bool is_mapped;
> -};
> -
> -struct chamelium_frame_dump {
> -	unsigned char *bgr;
> -	size_t size;
> -	int width;
> -	int height;
> -	struct chamelium_port *port;
> -};
> -
> -struct chamelium_fb_crc_async_data {
> -	cairo_surface_t *fb_surface;
> -
> -	pthread_t thread_id;
> -	igt_crc_t *ret;
> -};
> -
> -struct chamelium {
> -	xmlrpc_env env;
> -	xmlrpc_client *client;
> -	char *url;
> -
> -	/* Indicates the last port to have been used for capturing video */
> -	struct chamelium_port *capturing_port;
> -
> -	int drm_fd;
> -
> -	struct igt_list_head edids;
> -	struct chamelium_port ports[CHAMELIUM_MAX_PORTS];
> -	int port_count;
> -};
>   
>   bool igt_chamelium_allow_fsm_handling = true;
>   
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index 8882e13fb..b2b97434f 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -28,23 +28,35 @@
>   
>   #include "config.h"
>   
> -#include <stdbool.h>
> +#include <cairo.h>
> +#include <errno.h>
> +#include <glib.h>
> +#include <math.h>
> +#include <pixman.h>
> +#include <pthread.h>
>   #include <stddef.h>
> +#include <stdbool.h>
> +#include <string.h>
>   #include <xf86drmMode.h>
> +#include <xmlrpc-c/base.h>
> +#include <xmlrpc-c/client.h>
>   
> +#include "igt_aux.h"
> +#include "igt_core.h"
>   #include "igt_debugfs.h"
> +#include "igt_edid.h"
> +#include "igt_frame.h"
>   #include "igt_kms.h"
>   #include "igt_list.h"
> +#include "igt_pipe_crc.h"
> +#include "igt_rc.h"
> +
> +#define CHAMELIUM_HOTPLUG_DETECTION_DELAY 10
>   
>   struct igt_fb;
>   struct edid;
>   typedef struct _igt_crc igt_crc_t;
>   
> -struct chamelium;
> -struct chamelium_port;
> -struct chamelium_frame_dump;
> -struct chamelium_fb_crc_async_data;
> -
>   /**
>    * chamelium_check:
>    * @CHAMELIUM_CHECK_ANALOG: Fuzzy checking method for analog interfaces
> @@ -107,6 +119,46 @@ extern bool igt_chamelium_allow_fsm_handling;
>   
>   #define CHAMELIUM_HOTPLUG_TIMEOUT 20 /* seconds */
>   
> +struct chamelium_port {
> +        unsigned int type;
> +        int id;
> +        int connector_id;
> +        char *name;
> +        bool adapter_allowed;
> +        char *connector_path;
> +        bool is_mapped;
> +};
> +
> +struct chamelium_frame_dump {
> +        unsigned char *bgr;
> +        size_t size;
> +        int width;
> +        int height;
> +        struct chamelium_port *port;
> +};
> +
> +struct chamelium_fb_crc_async_data {
> +        cairo_surface_t *fb_surface;
> +
> +        pthread_t thread_id;
> +        igt_crc_t *ret;
> +};
> +
> +struct chamelium {
> +        xmlrpc_env env;
> +        xmlrpc_client *client;
> +        char *url;
> +
> +        /* Indicates the last port to have been used for capturing video */
> +        struct chamelium_port *capturing_port;
> +
> +        int drm_fd;
> +
> +        struct igt_list_head edids;
> +        struct chamelium_port ports[CHAMELIUM_MAX_PORTS];
> +        int port_count;
> +};
> +
>   /**
>    * chamelium_edid:
>    * @chamelium: instance of the chamelium where the EDID will be applied
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 825bfb110..827b72f54 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -22,7 +22,9 @@
>   
>   #define PIPE_CONTROL			0x7a000004
>   #define MEDIA_STATE_FLUSH		0x0
> +#ifndef MAX
>   #define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
> +#endif
>   #define SIZE_DATA			64
>   #define SIZE_BATCH			0x10000
>   #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
> index bf6510969..88b3717d4 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -758,7 +758,7 @@ igt_main
>   			igt_assert_f(chamelium_reprobe_connector(&data.display,
>   								 data.chamelium,
>   								 data.ports[i]) == DRM_MODE_CONNECTED,
> -								 "Output not connected\n");
> +								 "%s not connected\n", data.chamelium->ports[i].name);
>   		}
>   
>   		kmstest_set_vt_graphics_mode();

