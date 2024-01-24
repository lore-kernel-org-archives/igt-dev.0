Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B03BC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 07:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4014810E534;
	Wed, 24 Jan 2024 07:19:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFDC10E534
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 07:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706080753; x=1737616753;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jQp1jM9VPyZm4NqkKzcy/wHWA2CA3rAMw2Hj4fpyXqA=;
 b=H6urH7Wg+LlwjqC9/MYH2UGauir6Eaw1CaGHaTR0+0GgnpOjTwQA9a3X
 pAyLp2AbDyAnpz/Kfg7ZtrGA1d6M5mxJAa4vIMnMV2b+QYl7Kr14YN/3B
 kT40kYa70h6w2iQAFt9zhiMHwQK+uqM4GvaOYuG0i4XO/lIwxu2koj3lv
 j4RHUM4hUW+dc0S+AeGtconmfRU3eVg+43M9jKYGaB8UVAISL5i8mI0c9
 faWMRZuambuFJUaBtmitPFau9PqRnDIfDRx9eGtMZzQiH7TnBhIjiBaTi
 dERo3GvVFKW39jpAORT2m7HbOIY1Wx/9oAm+CsGEEk1/zI527WuKF5mBY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1653226"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1653226"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 23:19:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1815917"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 23:19:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 23:19:05 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 23:19:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 23:19:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 23:19:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LR+c9JcUnBtd2T1nkaqeVCCw9/eSi+z9LEM39SKhBwF29GKGsR736pB4ubxkknC3oMRHmCSJyYhbyLRQVgdx6gfWpC07deTi6nAUONAij62MfCmZlNjgk+/iw1535WlP+a6/sfpvM95dzjRi+vL9/xOE8Pzq7BfAZvhbd8b8dFW2y3AEW4FbfUBuwB/gx8YKWPPHyVgdaM3IWMMyQaL4927jLh+chRykM6ourlAWnhepOxuzHqY3xwYpwUALRvyGuPh1u8s4S1W5Ok5qR73+jDU/pcnNFI0l55Gkm/gi/42idyK4Qv837/ykMtqXwylFdcGARrJBvOgLrDE3VL3byg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQp1jM9VPyZm4NqkKzcy/wHWA2CA3rAMw2Hj4fpyXqA=;
 b=ULdvjGMYSBI3hPF+a7Dz1RzmY8DPjLcybvF6Q49Yiv1V7vsnqkigR/hfv/NCVnatr+4Q2+0COEFp1rjTlVEEULLJn22g1jrAed31rrvRq5RoLJbD+OnfHjB9nAdTykdhd8ndHJSs0FVOylpbEVjSXP2l1EyX6CC3PyF5LkL1kwB/pn8vrEbD9GRVoAh5ERrq7MV9Vy8VWT8c9KojanvVvkREFKyfPN4cTMGwbH1vGPMU/6vjRWk6gsxOAkB3/p7WH7PJF6mcefZpdAa+ueEwR15wG7nYtXXEHJkyFhJ78NwidUAdX6xAWHCELW4c4soItiywfVkLlY2HdaNi5dvNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 07:19:02 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::95ea:53cf:8d57:d120%7]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 07:19:02 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 5/8] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Thread-Topic: [PATCH i-g-t v1 5/8] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Thread-Index: AQHaTjkERfIGXFGwC0K+g/sgIRnUVbDojZGg
Date: Wed, 24 Jan 2024 07:19:02 +0000
Message-ID: <DS0PR11MB7264DE64F120B53DFAD5467AD97B2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
 <20240123201535.108793-6-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240123201535.108793-6-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CH3PR11MB8519:EE_
x-ms-office365-filtering-correlation-id: 6f4608b3-206c-4b7c-9216-08dc1cacbddf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CZi/f/Uad9+uV85HpIKxpMDworN08bnMAK5E2mBdXEEvYVI7O1au1s08EtVCU7B+9tuVE8ChvBzGfOvAhQOfuyiM/b5ya6uRUojhBM094xQ7stPEAJN2KdEJvKu93+6m1BiecCYlfOIGXdL+RK/k6Sp0JC1Kmi+XWXpVNFskDsP0klKBYNQiPEwVO4pGCQRQ3mEMrvS4YfZbA9GO36O8ybDHGHkgueS6pfHIA0piNNBRYth3tSDjIMvseSoVn9Gw0ifIoID+7bDG96FClqG/e2zgbmp7v9NsmCOCZmxaI+eDQlF8g9Kn4FDOroCbIJAU0qGnJEG8dFzjn1Iewxuq4k1P2w4d9u+RYx+o4uJxuIS6/g22SSOQAxxaaaealu5u9J8vs7F+mloFkvR/EyzZyFcO7HKTQ+w9n0eydUoz0beLxVZmZGyVvffLBkVrVtpHEigOyj7Jou+9Gn3PS5XEf3qSJ9rq0ICFdth8D1Io+h6aCtrMwDPKRA4a09a2vgRdAybBx//Ud84uoGswGYn9r9dKz5Ji1uql/ZPObVDfypLCnhD31RcFf4I4lnz0XoHGMhoWUXhse9FdC6C0xW+pBMYLS0xQeAAIZcpNG7Wbr50=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(8936002)(8676002)(4326008)(52536014)(2906002)(5660300002)(86362001)(33656002)(82960400001)(38070700009)(478600001)(83380400001)(66574015)(26005)(71200400001)(6506007)(122000001)(7696005)(9686003)(38100700002)(41300700001)(53546011)(76116006)(66946007)(64756008)(66446008)(66556008)(66476007)(110136005)(316002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHp5dFFnZXVWQWRNaXhuc1cwWGI0SWFUZkdMNU1RS0RLMnk5aVpTdFJ4TGNL?=
 =?utf-8?B?dkVtdnB1aWpYQWs2QXRwR1BHclJKVXJhZnZIdmdiUDZGYmdZWUpDNmhvNFMx?=
 =?utf-8?B?ZCs4SnNPcVRYZll5NlN2eTRCUkdjL0JLZUx2OHBSM0pDSEsxSE1pRDBpcXcv?=
 =?utf-8?B?c3lMQit4a2pWeVVLZ2ZkdlI5NitORnFQMVMzYldQSUxrS1ovV29WRTVSSDFS?=
 =?utf-8?B?aGJDR3BMd25OeS9yUlFwK2RHU2lJTFN2RktjdlNhbnpQYVl4R0FzRTQ2Zlh2?=
 =?utf-8?B?VXJkYWZCSVpPaUhoRzU1bTllQ1pTajZMVnBHbXdIcDhPU28xd3FFRFdpZWMv?=
 =?utf-8?B?M1B1VzBzdHdOaDd1U05IelFUUFJFSzlVdnpiQ0NUWHl6Y0VrbGhNeDd1eFdq?=
 =?utf-8?B?VmFNalB1R1pCb0YxcWkvbWhwZWJub09OcmZrVmsvRFkxa09rUENYM3JxVllv?=
 =?utf-8?B?RStQR2RudW9Ici9Sck9GMkhsUzh6NXBIRXh4Y3NpbjBpOWFCZ28ybENGQ1Jv?=
 =?utf-8?B?dUhpSGlXTW5sK0Q2QURRZkQvUURPZEE1Z1UwczlzNDBwS2FXRjJxVkE5MHN5?=
 =?utf-8?B?OTZWdG9TS2RtNHJxMUdaU0h0bkdQdHVQY29zdHFCZFJWN3dBYTZDRVR5eDYr?=
 =?utf-8?B?L2VHT3NKOEl1NTNROUN6WWVsS2pIWHRaN1dsYXo0ZzdQVzBZbzJlR2orWTd5?=
 =?utf-8?B?ZnJCWmF6YzY4TTF4MVd0dStqVC9TSGU2ZTI1LzBIR0FmNjhXM3dYUk56Nk40?=
 =?utf-8?B?K2M4NTFYM2o5K1JFY2FaSlk1bFM0SFpiMk5saTlvOVVzL1puYTF0MHdBWHp3?=
 =?utf-8?B?OEVwYTJVK2w2MXBYcWt3OFVFUVlyOFlDOHJnQW5WZ1pEUTFJVGhmTHpXQ3RO?=
 =?utf-8?B?S0U0K3BWVDRxeE9oZXA0a3NJK0Z5QUhsaW4rMzU3eW9TdTdwNCt1VkNnSDE3?=
 =?utf-8?B?QzRqRUJBa3BiQXd6Q1NjSW15SHV2OHNneWdlYnJLdFJ1bjVqYWVydDdZclZQ?=
 =?utf-8?B?TFhRL0JDaUF4N3dSalJZV3l3c3dnZ0VtWVRSaTdQY3hqaXd0U3U3dDVFUlkv?=
 =?utf-8?B?TmRkUVZzKzNPQVFCV3kzd1crMDV0aFJmVDVkbW01MmQ2UHFuZkRZNHZERUU5?=
 =?utf-8?B?djZpNEI0RGpTS1U2eTNvZzg3T3lQNkJlWi9UcU5nSFJnemZydXBqWENxV3c1?=
 =?utf-8?B?YWNrU1Z4WjEyenFqZFc3VldZdnJYS3ZuVVlGZTQyNFdndHR1cjBPRURrYlpO?=
 =?utf-8?B?OHBSR2xMNWFsd0tmOHMyM1NPV3B1eGFKbU5EYm80N3hqTEM3Uk5uUlppQWZQ?=
 =?utf-8?B?SG9hUDVmOUNmTVFhQVBuNGVleFpiRVE1STMzRm9tcXR6QW0xcDdnTW8zOUto?=
 =?utf-8?B?THQ3bXptUUsrdEY5ZlY2TWRQakE2R0I0ZTBQdTl6RzUzQzBwM3dYcWE2UnFS?=
 =?utf-8?B?WWsxT2U5dVViWUFwZjYvZ2VDa2RPWXo5WmdlaitIaDdocHdoZ2RWTTNtYVJX?=
 =?utf-8?B?VUYxRVZjKzJ6RzF6ZU94Q3BTa0lTNDdyaVBtRkEycFcrT0UzY2I3aTJIWkdy?=
 =?utf-8?B?ZUU4SEFvK2tqTFNESUpYTEhHdTdoN0VXSzlVSVhDZFBoNEpOVjNPOTlUMWlv?=
 =?utf-8?B?VkxPcmZQOVNLT3I3Zm5kWmZNU3NFVDl1U0c1ZEFsRTdDT2RBWUVxeTBWZUNC?=
 =?utf-8?B?RE8wYngwZlJreGxzTlJlN2NHNFpxY1N0cFZNNDB1clhMSXhHeWJsVFVDL2ZS?=
 =?utf-8?B?bnhwNGFTOFp2eXpuYWUxbDRVUkxEcUxYb2txZ0IxeDJZQ1pDdHYyRUZPQnNw?=
 =?utf-8?B?aDdiTkJNcUlYcXNhc28ycWN4Q2piZ2lMRDZjSjZ5ZldRSm0yenZpT3dHelJz?=
 =?utf-8?B?cFN2OGFYNFZLOEFEUEF2UlVSbUZaVkp6NktyMjV3ZHpKSk5pWGJmWUx1aEIy?=
 =?utf-8?B?bUtKc2NKVzE1YXVNU1lEQ2g4U3Vobm1sRzNBa3FUaVlaV3F1SFdmckNEU0E0?=
 =?utf-8?B?TnZXN0RKdW0yN3NEL2paY3RiVVZDRExYRXE3M3ZVSjU1am1PZ1poRjRic2N3?=
 =?utf-8?B?OG9jYVJ6dUxiRGZFQ2ZtcjhiTWtMYU0rZGJjK25NWFlqdFJ3UjVaMGkvU2xo?=
 =?utf-8?B?YTdUbi8rNmRNZU5hcmh5cmt2bmNjQm8xaFg3UW1TV0UvN0ZZb1FqL0pyaisw?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4608b3-206c-4b7c-9216-08dc1cacbddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 07:19:02.5024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sOOtV3wvLQFQ2Et5aNp07rCM/HekpQlS11w9tblfyJcW3GuFMefDUmwlJiRp+WTSYUf5Ma10M6qiu0mUt9WEyZsr2JWt12QZbOnjTZ2AbEHqYS/yzFbF1a2JFwVoosc0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

U21hbGwgbml0cGljazogaWd0X211bHRpX2ZvcmtfZm9yZWFjaF9ncHUgbWFjcm8gaXMgc2FpZCB0
byBiZSBpbnRyb2R1Y2VkIGluIHRoaXMgcGF0Y2gsIGJ1dCBpbiByZWFsaXR5IGl0IGlzIGludHJv
ZHVjZWQgaW4gNC84LiBPcmlnaW5hbGx5IGl0IHdhcyBpbiBvbmUgcGF0Y2gsIHNvIHRoYXQncyBh
IHNtYWxsIGlzc3VlIHdpdGggcGF0Y2ggc3BsaXR0aW5nLg0KDQpEb21pbmlrIEthcm9sDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1p
bC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDIz
LCAyMDI0IDk6MTYgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBQaWF0a293c2tpLCBEb21pbmlrIEthcm9sIDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50
ZWwuY29tPjsgQ2hyaXMNCj4gV2lsc29uIDxjaHJpcy5wLndpbHNvbkBsaW51eC5pbnRlbC5jb20+
OyBLYW1pbCBLb25pZWN6bnkNCj4gPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MSA1LzhdIGxpYi9pbnRlbF9tdWx0aWdwdTogSW50cm9k
dWNlZA0KPiBnZW1fbXVsdGlncHVfY291bnRfY2xhc3MgYW5kIGlndF9tdWx0aV9mb3JrX2ZvcmVh
Y2hfZ3B1DQo+IA0KPiBGcm9tOiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpIDxkb21pbmlrLmth
cm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiANCj4gSW50cm9kdWNlZCBnZW1fbXVsdGlncHVf
Y291bnRfY2xhc3MgZnVuY3Rpb24gdGhhdCByZXR1cm5zIGFuIGFjdHVhbA0KPiBudW1iZXIgb2Yg
R1BVcyBwcmVzZW50IGluIHN5c3RlbSwgd2hpY2ggYWxsb3dzIGZvciB3cml0aW5nIG11bHRpLUdQ
VSB0ZXN0DQo+IHNjZW5hcmlvcyB0aGF0IGRvZXMgbm90IHJlcXVpcmUgLS1kZXZpY2UNCj4gcGNp
OnZlbmRvcj1pbnRlbCxkZXZpY2U9ZGlzY3JldGUsY2FyZD1hbGwNCj4gdG8gcnVuIGFzIGludGVu
ZGVkLiBCYXNlZCBvbiBwYXRjaCBieSBDaHJpcyBXaWxzb24uDQo+IA0KPiBJbnRyb2R1Y2VkIGln
dF9tdWx0aV9mb3JrX2ZvcmVhY2hfZ3B1IG1hY3JvIHRoYXQgaGVscHMgd2l0aCB3cml0aW5nIG11
bHRpLQ0KPiBHUFUgdGVzdCBzY2VuYXJpb3MgaW4gaWRpb21hdGljIGZvcm06DQo+IA0KPiBpZ3Rf
bXVsdGlfZm9ya19mb3JlYWNoX2dwdShpOTE1LCBEUklWRVJfSU5URUwpDQo+IAl0ZXN0X2Z1bmN0
aW9uKGk5MTUpOw0KPiBpZ3Rfd2FpdGNoaWxkcmVuKCk7DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBE
b21pbmlrIEthcm9sIFBpxIV0a293c2tpDQo+IDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50
ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzLnAud2lsc29uQGxp
bnV4LmludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5r
b25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pbnRlbF9tdWx0aWdwdS5j
IHwgMTAgKysrKysrKysrKw0KPiAgbGliL2ludGVsX211bHRpZ3B1LmggfCAgMiArLQ0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbGliL2ludGVsX211bHRpZ3B1LmMgYi9saWIvaW50ZWxfbXVsdGlncHUuYyBpbmRl
eA0KPiA0NDZlM2ZmNWYuLjBlNzZkOGFhMyAxMDA2NDQNCj4gLS0tIGEvbGliL2ludGVsX211bHRp
Z3B1LmMNCj4gKysrIGIvbGliL2ludGVsX211bHRpZ3B1LmMNCj4gQEAgLTgsNiArOCwxNiBAQA0K
PiAgI2luY2x1ZGUgImlndF9kZXZpY2Vfc2Nhbi5oIg0KPiAgI2luY2x1ZGUgImludGVsX211bHRp
Z3B1LmgiDQo+IA0KPiAraW50IGdlbV9tdWx0aWdwdV9jb3VudF9jbGFzcyhpbnQgY2xhc3MpIHsN
Cj4gKwlpbnQgY291bnQgPSAwOw0KPiArDQo+ICsJaWd0X2ZvcmVhY2hfZ3B1KGZkLCBjbGFzcykN
Cj4gKwkJY291bnQrKzsNCj4gKw0KPiArCXJldHVybiBjb3VudDsNCj4gK30NCj4gKw0KPiAgdm9p
ZCBnZW1fcmVxdWlyZV9tdWx0aWdwdShpbnQgY291bnQpDQo+ICB7DQo+ICAJc3RydWN0IGlndF9k
ZXZpY2VzX3ByaW50X2Zvcm1hdCBmbXQgPSB7IGRpZmYgLS1naXQgYS9saWIvaW50ZWxfbXVsdGln
cHUuaA0KPiBiL2xpYi9pbnRlbF9tdWx0aWdwdS5oIGluZGV4IDVmOTgzMDdmZC4uYWQxZTVjZjA3
IDEwMDY0NA0KPiAtLS0gYS9saWIvaW50ZWxfbXVsdGlncHUuaA0KPiArKysgYi9saWIvaW50ZWxf
bXVsdGlncHUuaA0KPiBAQCAtOSw4ICs5LDggQEANCj4gICNpbmNsdWRlICJpZ3RfY29yZS5oIg0K
PiAgI2luY2x1ZGUgImlndF9kZXZpY2Vfc2Nhbi5oIg0KPiANCj4gLXZvaWQgZ2VtX3JlcXVpcmVf
bXVsdGlncHUoaW50IGNvdW50KTsNCj4gIGludCBnZW1fbXVsdGlncHVfY291bnRfY2xhc3MoaW50
IGNsYXNzKTsNCj4gK3ZvaWQgZ2VtX3JlcXVpcmVfbXVsdGlncHUoaW50IGNvdW50KTsNCj4gDQo+
ICAjZGVmaW5lIGlndF9mb3JlYWNoX2dwdShmZF9fLCBpZF9fKSBcDQo+ICAJZm9yIChpbnQgaWd0
X3VuaXF1ZShpKSA9IDAsIGZkX187IFwNCj4gLS0NCj4gMi40Mi4wDQoNCg==
