Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AD3C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EA010E15B;
	Thu, 20 Jun 2024 23:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwN4nAlL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF5010E15B
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718925091; x=1750461091;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=z72Jz+r7lZp4a83VYN9N1P8LWDG0x4tS2/ZIHjVKAU4=;
 b=VwN4nAlLw9yjdbKzKTg14F//kn3qgbvTnOfG/Cjz1Q9Ubx1YuShMaz2O
 aXLzolZeSJseTCkpDpUoiGg3F5Jdx/SG5hbcvoAbvEQ+YxBkSN8JYwhn8
 QYgKOj5WDIZCb7rNw5PJtaEOE4d+Ceu5PkqhyRKKTw+bloGJ+/UtjSz8+
 f1mxXjFR6QfBX6bGcZKKswXVzlxNqF5djaQ17/bt/ejKWWTWbXTCI1VWx
 fpp6dFn/2r/K5nlX3HUjFSSyKJnygEe2cInQe67DiY1GmBut0wPTkVrOW
 QTzBJXngpy+3TbrIn80h0XSdtnTL/y3DtHQiLI+KmZ57+lk1N/slY7Rxu Q==;
X-CSE-ConnectionGUID: ucsjqM6zQO6Fkw23/pfVkA==
X-CSE-MsgGUID: 6IB7ijoQTfu6yGINCV4yug==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16173846"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="16173846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:11:31 -0700
X-CSE-ConnectionGUID: vwCZ0DjTT+q8fRRBtUa9CQ==
X-CSE-MsgGUID: JLjXlf69TqmwYJXOOtmv8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="42481372"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:11:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:11:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:11:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSaW+W4S/zOvgq6+Qk28WuguYNVuhY8MqHy0pZGvLFNKsWn/SbVchOANxMBNwj0jebX6n3all7wMW5FC5hn5xfnDhLMtagKREANB5wODGJhFi64wvIJAuH5drwBa+4iwcuYeNAkIVqLcY1cOwCZyIB5g93qIx7MohAM6JHiSh61OELPsXoSOHzU+9lI0AnmQni2CJQSdmvJEJ4xJewhZhcIF51Cl8J7ewV4QKcu8Qontm4wGzvAGE0bincznMwL5fQtGsnl4tE3g+mALzYzR1aQHOZqmrMiorSVUgd7VhD2jlvRniNRsK6qUmuZseR/wcZQtsqY91TMcQfkfweNkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvmor4AqaHWVxnZY58eVPI40ldpFBkZjvW+GyktotdY=;
 b=OroqzuIfRQIvZOxcJB2GglXU8xYNw5vAP1pFwO2JMuiv3hY7OevG+2RsSlbwc2QtHPA9FTyCqX090VUQJVVtTRi/pTVDMZsrI01NtXjAeW1wqGRto3q6phUJ93S/rPzukXAaZFBTK6afZcYMaODO+kob4hRy4VaWoXLVbX7BQ6NDr9Ul0QH9J9am+NbidIZiIQYZDsiKO1c7cXALnX5t8xAqhN0CIzn2Lrs668Bmdfdvf3U0mNakiQT+/8AJl6C0En1QKapdswTeeiqDvqnp8yK4iy10L+1+wq05gW2riTV/15lP/8D4Rdj7h+l95sfqnazZeD/WnQCxdnPky2nSIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8697.namprd11.prod.outlook.com (2603:10b6:408:1fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33; Thu, 20 Jun
 2024 23:11:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:11:24 +0000
Date: Thu, 20 Jun 2024 16:11:21 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 10/28] tests/intel/xe_oa: Add first tests
Message-ID: <ZnS3GWwaHI9Q6VJe@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-11-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620200054.3550653-11-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0239.namprd04.prod.outlook.com
 (2603:10b6:303:87::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: a521cf9f-5d75-4323-b4f0-08dc917e4de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTdPaGpUcll6YXdpdEVFRGF0MDU2Sm9QMXF3bUR6ZVpVSkxsWXlJUzAwSXla?=
 =?utf-8?B?RllkRTFNSlBDL3FkMFVvZUdxVTJub1ZuWmdPczRiQm5nOTdqMVJ0aWdrdW5m?=
 =?utf-8?B?SlE0MklveVh2aldTeVVCejhjQlhUTjZpYWxuQmtacVQ5VGh1bVF1Nkkxdlg5?=
 =?utf-8?B?T0FoUkNxQ3BCbnFPMFc3L0ZXWU5tZFl4Ykg5VndJMWcrYy9KR1Y5MjdBL3dj?=
 =?utf-8?B?Y1RPcll4TURKSnY3ZWFDek5WRHdVdW8rcDZjYklxSkhGMW9UUi9TUHR6Zm1R?=
 =?utf-8?B?YmNLelR4bXJMSWlpZGFweW1sbjVkdTIvR1FFOGwrcTA2cThURGFTMklPdGVt?=
 =?utf-8?B?Z0ZWQldnL0MrTnprTXJ2Syt0TzJMRUpBVHpleUZFdzZ3cEpxbFhWY2tldnk5?=
 =?utf-8?B?YTNHanF4eG4zQTh4ZjZscW5DaUtEVW9sYy9aRnZ2UmJRM0NlOVIzMzFyNlJw?=
 =?utf-8?B?NnVIRGtNN2VZbVpSWFJEbnRtYUx5ZkJaYldRdHpYRGE2RlE2NnlGSVA2L2th?=
 =?utf-8?B?K0dIMFR3MlNwcTNZZ0dtQjdzSkMwQTVlaVh2MXdabXBKNDlMdG9UUVoyV3I2?=
 =?utf-8?B?WDBoRUJNbmN3UHdoWDQ0ZVBjWVdBZHZoNmVON3FUWHNOcjJhU1Q4b2FpaDlX?=
 =?utf-8?B?U01YQUt0ak5LYXd3bE91WFlPOGVoUnZUbWZZNitiRTFRWTZqbTIxcWs5dHRU?=
 =?utf-8?B?dU8xUDA0QnVzZ1J4bHpudDVxb3hPYWkyTHBpczJJekYxdVRFeXF1NVY4UmZC?=
 =?utf-8?B?L3EwTXp4anN0S1pDd2NncDNYSUQvMXB0aFpOZE04Rm1yU20vUmFkVUxNdkk3?=
 =?utf-8?B?ek1FcU0wTm1ONHpIMlFQSnE0UVEwU3pQOVNINmNFdGhTenVJbVcyR3RuSTRG?=
 =?utf-8?B?Zk5pcDZsZTJQR0EweEZkYXZObFFDYmd4blBmVGxNMVZ0L3FNaHM2L2M1b25M?=
 =?utf-8?B?UTJ4T05ibTZlejcrRlZBVkViTGE5eFFzUXkzTmpCTjBLc20rL09tR2U0VnF0?=
 =?utf-8?B?NVRIL2VrQTV2MytvaTR5SUFyd2U0YkZ6S0xCa0g4WWZQTHluVzV3Y25TZngv?=
 =?utf-8?B?a0k1T2JyR3UwWm1iajkrbmpwTUpJWUZWWnFTMHJ1N3A0UUQ1NFUwU2RQTG5Y?=
 =?utf-8?B?T29JUVM3WTBWazRnL1Q4ZG5MU3hMdUtFM0lqOGNXZTZKWFNXYmk5MlJkTnJO?=
 =?utf-8?B?bTN6QjBUZHN6Zm9iNnh4SFk2NDBsaGd2bDhReDRacUlpUlB4S00vbzc1eXZE?=
 =?utf-8?B?TWVKZ1JBLzV0S2NwMUxnOVo1d2pReUFtQnZUMDVUTnZkUG5HbjBQRzBtbzJ2?=
 =?utf-8?B?RkpsUE15VTVFa3UzVWpZc1hxciszY2t5b3pkV0dxM0tkbjQxb2xTdVpHTmJq?=
 =?utf-8?B?OGowN2FZQUMrcG56a2h4T2o5MGFrajc2eDd1Z0lKK0tVUzRmNGVtY3QzYitF?=
 =?utf-8?B?czk3dk50OGd0R3VhMURPQzZhcENLK3FKNTZCU3loNFR0QkZtWjRTdTRrU2Jp?=
 =?utf-8?B?aVVlUERhWldpNXJ5WlZTbUh0eUxBUHIyakpRY2VURmpnZUsrSkZDV3dnS0NP?=
 =?utf-8?B?VHBzemJQd1pkVng3cDg5WklaME10TnB6dXZ4a1R5S2NhMDk3K3cyU1ZiVEpC?=
 =?utf-8?B?RzhvN1Z3cGhxTzlmdFhNODhNVGZXU1YybTNNb1o5VHBQNk02Uy85eTdNVXFI?=
 =?utf-8?B?WExNNGVYby85aTRXWTRwYVhaWnpKMFJmb25GUDZ2NWNMbmtqVDZyOVlxS0ND?=
 =?utf-8?Q?/C0juf0pAw5hL8fn9k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDZ6WlUyVGxlVVg0NmlLb0NjN1lhUjdIYVdNb2ZBMmliUjI0MkxLZ1hMSG9R?=
 =?utf-8?B?R0diM3M1VHJoNHRCd0ErZkd1Q1ExYmNJRWxYSUhhdy9Td0Vaa0lTRldlT3lC?=
 =?utf-8?B?VWdRZGNDWDV5NHg5YVVGSWhmL0RXNi8vUCtzUThHb2ZHS2xzZ0FpZTRJV1ZQ?=
 =?utf-8?B?ZTdIa3VucHU1aUhXOWR5OEVyTHJSYy82SjI0ZjhSZHkreDFXOWl3RGlNUUJo?=
 =?utf-8?B?UmZvdG40Uy96a05KRDJrVjlCcHVrbjVhSXduaG5kWkpKeWovQkJsNVRaSWFL?=
 =?utf-8?B?RzhKbk8yUEZicnpEVml4L0hFc0hYMHA5SXRVL2E4ZnJyRzFJZ0FndUEyZENy?=
 =?utf-8?B?VFd1RS81dGtkN0hFWWRCSkJPWnkyRWRYTWorNzc0bi9YcTlRcENpRHRzNDNh?=
 =?utf-8?B?RUNZZUlIZnlabTFDcjM1OGVZSk4zWXBBY2VvelFDemxsbmpEWGVzTlRLVWxs?=
 =?utf-8?B?NVFUejJiOUtYcW5lVWZ0ZE1SNkVxVVNSZEN1WGdEVWNGSUx2d211UzVPMCs4?=
 =?utf-8?B?MDNacUNVNzkzYlR4RFhmdWQ1V0hqQzRxVzBuUzc2NXRURnpjUkhOaUpXVXJX?=
 =?utf-8?B?OXp0M21NNHgxZEYzM2VzSTJsOVFtZkJrWjViL1J4dWo2ZU5hUUU4VmZzVXBl?=
 =?utf-8?B?SlBIUWxkM0JnRE01YUh5enlVR3dJaDVLVEhzVmEvS1RnMkJFTVovYU1YdjRQ?=
 =?utf-8?B?V0lSVWNFOHFRZnIvMkV1ZzBySXpvRGc1VkdBdnQ3R1RUSzQ4K091Vm1MNll6?=
 =?utf-8?B?clRiMjFGQ29pN1BlRVR2VGpyb3N0cDI2TU1GaGJMQi9iYmdqYjdlakJ1V2cz?=
 =?utf-8?B?ZFRWWGpoaW8yNnJiQkhqbUlHNDF3Ni9NVTYvMElKcHVTNWpDcXZaK0dzeUZC?=
 =?utf-8?B?TDYzdHNGZ2pjZis3Zm5uaUpDY3EwYmc5U2lVRUFvY0Y2MFM5Q0FrcVlsZUVr?=
 =?utf-8?B?YlJhZjVkUldBQTR6bTZXLzJsVlhJMDNUcENXeW52TlVOeVZYUXFWSUxBem42?=
 =?utf-8?B?ODRVQzVwTUJIK3JsUGFYZHFYdWphallOQlQvODJWM3ZqRWQrY1krOHQya3k4?=
 =?utf-8?B?ZUVuWmEzTTI0Tzl5Yk9mSDJXN1dQeUg3Q3JONWdvWlkvU2ppQVk2SnV2RExL?=
 =?utf-8?B?TjBjTTBIQ2xhbG54Q1drTXRhQlk3bjZ6QnRiOGw2VUErMW42WUprQ1AxSmlY?=
 =?utf-8?B?V0tqRzlGSHFTSUcrUVp2Tm9wY0kvYzB4LzJSK0N2NDBqdFZubDBpNjRCeGNG?=
 =?utf-8?B?aU10Nnk5T2x0N0dlL3ZFVzZVMlFadklHZDUxei91YWNUVzVFVkkxTkJMdG9y?=
 =?utf-8?B?ampGNktUSlMva0Q5YkcrcCtDc0hDZ1I1UVVReWkxaTdhY1dQNFIwcW04cWU1?=
 =?utf-8?B?Y2dCZlNoVnd5RmNBTWdyN1dMVWNkem9HMFdBNk9vUXJaeHpzR2VLZXhkalFa?=
 =?utf-8?B?SXNPclVRazdzeVNXSlR2VkhhZmlkT3NxOHFva3dzd09JejBVN0pLVUxhSisr?=
 =?utf-8?B?Zkw4bm1OckxDd293KzFWVGVwdXIxVmF1ZmRuYy9VeWQ4NU5KcFpQNHVYK1l2?=
 =?utf-8?B?eXIwRnB6TTIyVDV4ZHJlaS9HUnN2OVB5MzhqM00zYXlGMWM4clZsbVZ5Y3NR?=
 =?utf-8?B?OEIxSTQ0OWNmbitoQzRaWGpCSGxVR2lpU0dDV0lqNXBENDlkUENZdXRDOGR6?=
 =?utf-8?B?dm5xeGdBalJaYXdNQnl1bW95U0t1eDdjSE9adUY2dnhhb1BETWE0THNxSjBw?=
 =?utf-8?B?eEtzTVFzUHBjQjBpVFJBcllZMGtDNU9XZkJVVWlmTnY5MkxGMnJEWkw4ZnFr?=
 =?utf-8?B?M2xtYU1ZM0RFZWZSMU03VjVQWk03by9DRFRqUkxUK2FhQXBTL3BOUVJOdGdY?=
 =?utf-8?B?SzIyZFoyL1lzY2pqYnArYmxKMHN3RXI5NUFZdHA4T0VEUWd0MGZvbzBJM1RN?=
 =?utf-8?B?bUdWK253d0ppK2hENWRZMEV0aGhJbitKcUNGSXRPd0tVNEl5VDE3L29DRGVE?=
 =?utf-8?B?cE9sSzVUVTdhV0FWTmg4L3hJa29lWFo2bWRjcWdWeVE5eWdIWFNZVU8wTzdZ?=
 =?utf-8?B?bVlGVUM4ZXQzNWRZd0p3NUNrU2cyTEJSWG1Iay9FY1EwUDQxVmYvRm5CQ3d6?=
 =?utf-8?B?TUVhbG1EYVBuWUJCRU9yam1HV0FpV3dIa01vc3JaMmVZZEtGTXhZeG10UzJP?=
 =?utf-8?Q?lB9xWfh9afXMs6zGc8NlDsw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a521cf9f-5d75-4323-b4f0-08dc917e4de3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:11:24.0342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PQ2daMEeXgoHknrTbQ9bksgt+w11zpCOmTyc8+5pd33lChesOOMDTjtwDkE+EC0UTv691rescUea3OnGykjZmNpUJ4ImjBoEb2VyH/03Fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8697
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

On Thu, Jun 20, 2024 at 01:00:35PM -0700, Ashutosh Dixit wrote:
>Add "xe-ref-count" and "sysctl-defaults" subtests.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/intel/xe_oa.c | 803 ++++++++++++++++++++++++++++++++++++++++++++
> tests/meson.build   |   2 +
> 2 files changed, 805 insertions(+)
> create mode 100644 tests/intel/xe_oa.c
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>new file mode 100644
>index 0000000000..5c872b74b2
>--- /dev/null
>+++ b/tests/intel/xe_oa.c
>@@ -0,0 +1,803 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <stdlib.h>
>+#include <stdio.h>
>+#include <string.h>
>+#include <fcntl.h>
>+#include <inttypes.h>
>+#include <errno.h>
>+#include <signal.h>
>+#include <sys/stat.h>
>+#include <sys/time.h>
>+#include <sys/times.h>
>+#include <sys/types.h>
>+#include <dirent.h>
>+#include <time.h>
>+#include <poll.h>
>+#include <math.h>
>+
>+#include "drm.h"
>+#include "igt.h"
>+#include "igt_device.h"
>+#include "igt_sysfs.h"
>+#include "xe/xe_ioctl.h"
>+#include "xe/xe_query.h"
>+#include "xe/xe_oa.h"
>+
>+/**
>+ * TEST: perf
>+ * Description: Test the Xe OA metrics streaming interface
>+ * Category: Core
>+ * Mega feature: Performance interface
>+ * Sub-category: Performance tests
>+ * Functionality: oa
>+ * Feature: xe streaming interface, oa
>+ * Test category: Perf
>+ */
>+
>+#define OA_MI_REPORT_PERF_COUNT		((0x28 << 23) | (4 - 2))
>+
>+#define OAREPORT_REASON_MASK           0x3f
>+#define OAREPORT_REASON_SHIFT          19
>+#define OAREPORT_REASON_TIMER          (1<<0)
>+#define OAREPORT_REASON_INTERNAL       (3<<1)
>+#define OAREPORT_REASON_CTX_SWITCH     (1<<3)
>+#define OAREPORT_REASON_GO             (1<<4)
>+#define OAREPORT_REASON_CLK_RATIO      (1<<5)
>+
>+#define PIPE_CONTROL_GLOBAL_SNAPSHOT_COUNT_RESET	(1 << 19)
>+#define PIPE_CONTROL_SYNC_GFDT	  (1 << 17)
>+#define PIPE_CONTROL_NO_WRITE	   (0 << 14)
>+#define PIPE_CONTROL_WRITE_IMMEDIATE    (1 << 14)
>+#define PIPE_CONTROL_WRITE_DEPTH_COUNT  (2 << 14)
>+#define PIPE_CONTROL_RENDER_TARGET_FLUSH (1 << 12)
>+#define PIPE_CONTROL_INSTRUCTION_INVALIDATE (1 << 11)
>+#define PIPE_CONTROL_ISP_DIS	    (1 << 9)
>+#define PIPE_CONTROL_INTERRUPT_ENABLE   (1 << 8)
>+/* GT */
>+#define PIPE_CONTROL_DATA_CACHE_INVALIDATE      (1 << 5)
>+#define PIPE_CONTROL_PPGTT_WRITE	(0 << 2)
>+#define PIPE_CONTROL_GLOBAL_GTT_WRITE   (1 << 2)
>+
>+#define MAX_OA_BUF_SIZE (16 * 1024 * 1024)
>+#define OA_BUFFER_SIZE MAX_OA_BUF_SIZE
>+
>+#define RING_FORCE_TO_NONPRIV_ADDRESS_MASK 0x03fffffc
>+/*
>+ * Engine specific registers defined as offsets from engine->mmio_base. For
>+ * these registers, OR bit[0] with 1 so we can add the mmio_base when running
>+ * engine specific test.
>+ */
>+#define MMIO_BASE_OFFSET 0x1
>+
>+#define OAG_OASTATUS (0xdafc)
>+#define OAG_PERF_COUNTER_B(idx) (0xDA94 + 4 * (idx))
>+#define OAG_OATAILPTR (0xdb04)
>+#define OAG_OATAILPTR_MASK 0xffffffc0
>+#define OAG_OABUFFER (0xdb08)
>+
>+#define ADD_PROPS(_head, _tail, _key, _value) \
>+	do { \
>+		igt_assert((_tail - _head) < (DRM_XE_OA_PROPERTY_MAX * 2)); \
>+		*_tail++ = DRM_XE_OA_PROPERTY_##_key; \
>+		*_tail++ = _value; \
>+	} while (0)
>+
>+struct accumulator {
>+#define MAX_RAW_OA_COUNTERS 62
>+	enum intel_xe_oa_format_name format;
>+
>+	uint64_t deltas[MAX_RAW_OA_COUNTERS];
>+};
>+
>+/* OA unit types */
>+enum {
>+	OAG,
>+	OAR,
>+	OAM,
>+
>+	MAX_OA_TYPE,
>+};
>+
>+struct oa_format {
>+	const char *name;
>+	size_t size;
>+	int a40_high_off; /* bytes */
>+	int a40_low_off;
>+	int n_a40;
>+	int a64_off;
>+	int n_a64;
>+	int a_off;
>+	int n_a;
>+	int first_a;
>+	int first_a40;
>+	int b_off;
>+	int n_b;
>+	int c_off;
>+	int n_c;
>+	int oa_type; /* of enum intel_xe_oa_format_name */
>+	bool report_hdr_64bit;
>+	int counter_select;
>+	int counter_size;
>+	int bc_report;
>+};
>+
>+static struct oa_format gen12_oa_formats[XE_OA_FORMAT_MAX] = {
>+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8] = {
>+		"A32u40_A4u32_B8_C8", .size = 256,
>+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 32,
>+		.a_off = 144, .n_a = 4, .first_a = 32,
>+		.b_off = 192, .n_b = 8,
>+		.c_off = 224, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAG,
>+		.counter_select = 5,
>+	},
>+};
>+
>+static struct oa_format dg2_oa_formats[XE_OA_FORMAT_MAX] = {
>+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8] = {
>+		"A32u40_A4u32_B8_C8", .size = 256,
>+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 32,
>+		.a_off = 144, .n_a = 4, .first_a = 32,
>+		.b_off = 192, .n_b = 8,
>+		.c_off = 224, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAR,
>+		.counter_select = 5,
>+	},
>+	/* This format has A36 and A37 interleaved with high bytes of some A
>+	 * counters, so we will accumulate only subset of counters.
>+	 */
>+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8] = {
>+		"A24u40_A14u32_B8_C8", .size = 256,
>+		/* u40: A4 - A23 */
>+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 20, .first_a40 = 4,
>+		/* u32: A0 - A3 */
>+		.a_off = 16, .n_a = 4,
>+		.b_off = 192, .n_b = 8,
>+		.c_off = 224, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAG,
>+		.counter_select = 5,
>+	},
>+	/* This format has 24 u64 counters ranging from A0 - A35. Until we come
>+	 * up with a better mechanism to define missing counters, we will use a
>+	 * subset of counters that are indexed by one-increments - A28 - A35.
>+	 */
>+	[XE_OAC_FORMAT_A24u64_B8_C8] = {
>+		"OAC_A24u64_B8_C8", .size = 320,
>+		.a64_off = 160, .n_a64 = 8,
>+		.b_off = 224, .n_b = 8,
>+		.c_off = 256, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1, },
>+};
>+
>+static struct oa_format mtl_oa_formats[XE_OA_FORMAT_MAX] = {
>+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8] = {
>+		"A32u40_A4u32_B8_C8", .size = 256,
>+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 32,
>+		.a_off = 144, .n_a = 4, .first_a = 32,
>+		.b_off = 192, .n_b = 8,
>+		.c_off = 224, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAR,
>+		.counter_select = 5,
>+	},
>+	/* This format has A36 and A37 interleaved with high bytes of some A
>+	 * counters, so we will accumulate only subset of counters.
>+	 */
>+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8] = {
>+		"A24u40_A14u32_B8_C8", .size = 256,
>+		/* u40: A4 - A23 */
>+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 20, .first_a40 = 4,
>+		/* u32: A0 - A3 */
>+		.a_off = 16, .n_a = 4,
>+		.b_off = 192, .n_b = 8,
>+		.c_off = 224, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAG,
>+		.counter_select = 5,
>+	},
>+
>+	/* Treat MPEC countes as A counters for now */
>+	[XE_OAM_FORMAT_MPEC8u64_B8_C8] = {
>+		"MPEC8u64_B8_C8", .size = 192,
>+		.a64_off = 32, .n_a64 = 8,
>+		.b_off = 96, .n_b = 8,
>+		.c_off = 128, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAM_MPEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1,
>+	},
>+	[XE_OAM_FORMAT_MPEC8u32_B8_C8] = {
>+		"MPEC8u32_B8_C8", .size = 128,
>+		.a_off = 32, .n_a = 8,
>+		.b_off = 64, .n_b = 8,
>+		.c_off = 96, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAM_MPEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 2,
>+	},
>+	/* This format has 24 u64 counters ranging from A0 - A35. Until we come
>+	 * up with a better mechanism to define missing counters, we will use a
>+	 * subset of counters that are indexed by one-increments - A28 - A35.
>+	 */
>+	[XE_OAC_FORMAT_A24u64_B8_C8] = {
>+		"OAC_A24u64_B8_C8", .size = 320,
>+		.a64_off = 160, .n_a64 = 8,
>+		.b_off = 224, .n_b = 8,
>+		.c_off = 256, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1, },
>+};
>+
>+static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
>+	[XE_OA_FORMAT_PEC64u64] = {
>+		"PEC64u64", .size = 576,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1,
>+		.counter_size = 1,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC64u64_B8_C8] = {
>+		"PEC64u64_B8_C8", .size = 640,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1,
>+		.counter_size = 1,
>+		.bc_report = 1 },
>+	[XE_OA_FORMAT_PEC64u32] = {
>+		"PEC64u32", .size = 320,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1,
>+		.counter_size = 0,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC32u64_G1] = {
>+		"PEC32u64_G1", .size = 320,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 5,
>+		.counter_size = 1,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC32u32_G1] = {
>+		"PEC32u32_G1", .size = 192,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 5,
>+		.counter_size = 0,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC32u64_G2] = {
>+		"PEC32u64_G2", .size = 320,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 6,
>+		.counter_size = 1,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC32u32_G2] = {
>+		"PEC32u64_G2", .size = 192,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 6,
>+		.counter_size = 0,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC36u64_G1_32_G2_4] = {
>+		"PEC36u64_G1_32_G2_4", .size = 320,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 3,
>+		.counter_size = 1,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32] = {
>+		"PEC36u64_G1_4_G2_32_G2", .size = 320,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 4,
>+		.counter_size = 1,
>+		.bc_report = 0 },
>+};
>+
>+static int drm_fd = -1;
>+static int sysfs = -1;
>+static int pm_fd = -1;
>+static int stream_fd = -1;
>+static uint32_t devid;
>+
>+struct drm_xe_engine_class_instance default_hwe;
>+
>+static struct intel_xe_perf *intel_xe_perf;
>+static uint64_t oa_exp_1_millisec;
>+struct intel_mmio_data mmio_data;
>+
>+static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	const char *test_set_name = NULL;
>+	struct intel_xe_perf_metric_set *metric_set_iter;
>+	struct intel_xe_perf_metric_set *test_set = NULL;
>+
>+	if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
>+	    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
>+		test_set_name = "TestOa";
>+	else if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
>+		  hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE) &&
>+		 HAS_OAM(devid))
>+		test_set_name = "MediaSet1";
>+	else
>+		igt_assert(!"reached");
>+
>+	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
>+		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
>+			test_set = metric_set_iter;
>+			break;
>+		}
>+	}
>+
>+	igt_assert(test_set);
>+
>+	/*
>+	 * configuration was loaded in init_sys_info() ->
>+	 * intel_xe_perf_load_perf_configs(), and test_set->perf_oa_metrics_set
>+	 * should point to metric id returned by the config add ioctl. 0 is
>+	 * invalid.
>+	 */
>+	igt_assert_neq_u64(test_set->perf_oa_metrics_set, 0);
>+
>+	igt_debug("engine %d:%d - %s metric set UUID = %s\n",
>+		  hwe->engine_class,
>+		  hwe->engine_instance,
>+		  test_set->symbol_name,
>+		  test_set->hw_config_guid);
>+
>+	return test_set;
>+}
>+#define default_test_set metric_set(&default_hwe)
>+
>+static void set_fd_flags(int fd, int flags)
>+{
>+	int old = fcntl(fd, F_GETFL, 0);
>+
>+	igt_assert_lte(0, old);
>+	igt_assert_eq(0, fcntl(fd, F_SETFL, old | flags));
>+}
>+
>+static u32 get_stream_status(int fd)
>+{
>+	struct drm_xe_oa_stream_status status;
>+
>+	do_ioctl(fd, DRM_XE_PERF_IOCTL_STATUS, &status);
>+
>+	return status.oa_status;
>+}
>+
>+static void
>+dump_report(const uint32_t *report, uint32_t size, const char *message) {
>+	uint32_t i;
>+	igt_debug("%s\n", message);
>+	for (i = 0; i < size; i += 4) {
>+		igt_debug("%08x %08x %08x %08x\n",
>+				report[i],
>+				report[i + 1],
>+				report[i + 2],
>+				report[i + 3]);
>+	}
>+}
>+
>+static struct oa_format
>+get_oa_format(enum intel_xe_oa_format_name format)
>+{
>+	if (IS_DG2(devid))
>+		return dg2_oa_formats[format];
>+	else if (IS_METEORLAKE(devid))
>+		return mtl_oa_formats[format];
>+	else if (intel_graphics_ver(devid) >= IP_VER(20, 0))
>+		return lnl_oa_formats[format];
>+	else
>+		return gen12_oa_formats[format];
>+}
>+
>+static u64 oa_format_fields(u64 name)
>+{
>+#define FIELD_PREP_ULL(_mask, _val) \
>+	(((_val) << (__builtin_ffsll(_mask) - 1)) & (_mask))
>+
>+	struct oa_format f = get_oa_format(name);
>+
>+	/* 0 format name is invalid */
>+	if (!name)
>+		memset(&f, 0xff, sizeof(f));
>+
>+	return FIELD_PREP_ULL(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, (u64)f.oa_type) |
>+		FIELD_PREP_ULL(DRM_XE_OA_FORMAT_MASK_COUNTER_SEL, (u64)f.counter_select) |
>+		FIELD_PREP_ULL(DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE, (u64)f.counter_size) |
>+		FIELD_PREP_ULL(DRM_XE_OA_FORMAT_MASK_BC_REPORT, (u64)f.bc_report);
>+}
>+#define __ff oa_format_fields
>+
>+static void
>+__perf_close(int fd)
>+{
>+	close(fd);
>+	stream_fd = -1;
>+
>+	if (pm_fd >= 0) {
>+		close(pm_fd);
>+		pm_fd = -1;
>+	}
>+}
>+
>+static int
>+__perf_open(int fd, struct intel_xe_oa_open_prop *param, bool prevent_pm)
>+{
>+	int ret;
>+	int32_t pm_value = 0;
>+
>+	if (stream_fd >= 0)
>+		__perf_close(stream_fd);
>+	if (pm_fd >= 0) {
>+		close(pm_fd);
>+		pm_fd = -1;
>+	}
>+
>+	ret = intel_xe_perf_ioctl(fd, DRM_XE_PERF_OP_STREAM_OPEN, param);
>+
>+	igt_assert(ret >= 0);
>+	errno = 0;
>+
>+	if (prevent_pm) {
>+		pm_fd = open("/dev/cpu_dma_latency", O_RDWR);
>+		igt_assert(pm_fd >= 0);
>+
>+		igt_assert_eq(write(pm_fd, &pm_value, sizeof(pm_value)), sizeof(pm_value));
>+	}
>+
>+	return ret;
>+}
>+
>+static uint64_t
>+read_u64_file(const char *path)
>+{
>+	FILE *f;
>+	uint64_t val;
>+
>+	f = fopen(path, "r");
>+	igt_assert(f);
>+
>+	igt_assert_eq(fscanf(f, "%"PRIu64, &val), 1);
>+
>+	fclose(f);
>+
>+	return val;
>+}
>+
>+static void
>+write_u64_file(const char *path, uint64_t val)
>+{
>+	FILE *f;
>+
>+	f = fopen(path, "w");
>+	igt_assert(f);
>+
>+	igt_assert(fprintf(f, "%"PRIu64, val) > 0);
>+
>+	fclose(f);
>+}
>+
>+static uint32_t
>+report_reason(const uint32_t *report)
>+{
>+	return ((report[0] >> OAREPORT_REASON_SHIFT) &
>+		OAREPORT_REASON_MASK);
>+}
>+
>+static uint64_t
>+oa_timestamp(const uint32_t *report, enum intel_xe_oa_format_name format)
>+{
>+	struct oa_format fmt = get_oa_format(format);
>+
>+	return fmt.report_hdr_64bit ? *(uint64_t *)&report[2] : report[1];
>+}
>+
>+static uint64_t
>+timebase_scale(uint64_t delta)
>+{
>+	return (delta * NSEC_PER_SEC) / intel_xe_perf->devinfo.timestamp_frequency;
>+}
>+
>+/* Returns: the largest OA exponent that will still result in a sampling period
>+ * less than or equal to the given @period.
>+ */
>+static int
>+max_oa_exponent_for_period_lte(uint64_t period)
>+{
>+	/* NB: timebase_scale() takes a uint64_t and an exponent of 30
>+	 * would already represent a period of ~3 minutes so there's
>+	 * really no need to consider higher exponents.
>+	 */
>+	for (int i = 0; i < 30; i++) {
>+		uint64_t oa_period = timebase_scale(2 << i);
>+
>+		if (oa_period > period)
>+			return max(0, i - 1);
>+	}
>+
>+	igt_assert(!"reached");
>+	return -1;
>+}
>+
>+static bool
>+oa_report_is_periodic(uint32_t oa_exponent, const uint32_t *report)
>+{
>+	if (report_reason(report) & OAREPORT_REASON_TIMER)
>+		return true;
>+
>+	return false;
>+}
>+
>+static bool
>+init_sys_info(void)
>+{
>+	igt_assert_neq(devid, 0);
>+
>+	intel_xe_perf = intel_xe_perf_for_fd(drm_fd, 0);
>+	igt_require(intel_xe_perf);
>+
>+	igt_debug("n_eu_slices: %"PRIu64"\n", intel_xe_perf->devinfo.n_eu_slices);
>+	igt_debug("n_eu_sub_slices: %"PRIu64"\n", intel_xe_perf->devinfo.n_eu_sub_slices);
>+	igt_debug("n_eus: %"PRIu64"\n", intel_xe_perf->devinfo.n_eus);
>+	igt_debug("timestamp_frequency = %"PRIu64"\n",
>+		  intel_xe_perf->devinfo.timestamp_frequency);
>+	igt_assert_neq(intel_xe_perf->devinfo.timestamp_frequency, 0);
>+
>+	intel_xe_perf_load_perf_configs(intel_xe_perf, drm_fd);
>+
>+	oa_exp_1_millisec = max_oa_exponent_for_period_lte(1000000);
>+
>+	return true;
>+}
>+
>+static void
>+read_2_oa_reports(int format_id,
>+		  int exponent,
>+		  uint32_t *oa_report0,
>+		  uint32_t *oa_report1,
>+		  bool timer_only)
>+{
>+	size_t format_size = get_oa_format(format_id).size;
>+	uint32_t exponent_mask = (1 << (exponent + 1)) - 1;
>+
>+	/* Note: we allocate a large buffer so that each read() iteration
>+	 * should scrape *all* pending records.
>+	 *
>+	 * The largest buffer the OA unit supports is 16MB.
>+	 *
>+	 * Being sure we are fetching all buffered reports allows us to
>+	 * potentially throw away / skip all reports whenever we see
>+	 * a _REPORT_LOST notification as a way of being sure are
>+	 * measurements aren't skewed by a lost report.
>+	 *
>+	 * Note: that is is useful for some tests but also not something
>+	 * applications would be expected to resort to. Lost reports are
>+	 * somewhat unpredictable but typically don't pose a problem - except
>+	 * to indicate that the OA unit may be over taxed if lots of reports
>+	 * are being lost.
>+	 */
>+	int max_reports = MAX_OA_BUF_SIZE / format_size;
>+	int buf_size = format_size * max_reports * 1.5;
>+	uint8_t *buf = malloc(buf_size);
>+	int n = 0;
>+
>+	for (int i = 0; i < 1000; i++) {
>+		u32 oa_status = 0;
>+		ssize_t len;
>+
>+		while ((len = read(stream_fd, buf, buf_size)) < 0 && errno == EINTR)
>+			;
>+		if (errno == EIO) {
>+			oa_status = get_stream_status(stream_fd);
>+			igt_debug("oa_status %#x\n", oa_status);
>+			continue;
>+		}
>+
>+		igt_assert(len > 0);
>+		igt_debug("read %d bytes\n", (int)len);
>+
>+		/* Need at least 2 reports */
>+		if (len < 2 * format_size)
>+			continue;
>+
>+		for (size_t offset = 0; offset < len; offset += format_size) {
>+			const uint32_t *report = (void *)(buf + offset);
>+
>+			/* Currently the only test that should ever expect to
>+			 * see a _BUFFER_LOST error is the buffer_fill test,
>+			 * otherwise something bad has probably happened...
>+			 */
>+			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
>+
>+			/* At high sampling frequencies the OA HW might not be
>+			 * able to cope with all write requests and will notify
>+			 * us that a report was lost. We restart our read of
>+			 * two sequential reports due to the timeline blip this
>+			 * implies
>+			 */
>+			if (oa_status & DRM_XE_OASTATUS_REPORT_LOST) {
>+				igt_debug("read restart: OA trigger collision / report lost\n");
>+				n = 0;
>+
>+				/* XXX: break, because we don't know where
>+				 * within the series of already read reports
>+				 * there could be a blip from the lost report.
>+				 */
>+				break;
>+			}
>+
>+			dump_report(report, format_size / 4, "oa-formats");
>+
>+			igt_debug("read report: reason = %x, timestamp = %"PRIx64", exponent mask=%x\n",
>+				  report[0], oa_timestamp(report, format_id), exponent_mask);
>+
>+			/* Don't expect zero for timestamps */
>+			igt_assert_neq_u64(oa_timestamp(report, format_id), 0);
>+
>+			if (timer_only) {
>+				if (!oa_report_is_periodic(exponent, report)) {
>+					igt_debug("skipping non timer report\n");
>+					continue;
>+				}
>+			}
>+
>+			if (n++ == 0)
>+				memcpy(oa_report0, report, format_size);
>+			else {
>+				memcpy(oa_report1, report, format_size);
>+				free(buf);
>+				return;
>+			}
>+		}
>+	}
>+
>+	free(buf);
>+
>+	igt_assert(!"reached");
>+}
>+
>+static unsigned read_xe_module_ref(void)
>+{
>+	FILE *fp = fopen("/proc/modules", "r");
>+	char *line = NULL;
>+	size_t line_buf_size = 0;
>+	int len = 0;
>+	unsigned ref_count;
>+	char mod[8];
>+	int modn = 3;
>+
>+	igt_assert(fp);
>+
>+	strcpy(mod, "xe ");
>+	while ((len = getline(&line, &line_buf_size, fp)) > 0) {
>+		if (strncmp(line, mod, modn) == 0) {
>+			unsigned long mem;
>+			int ret = sscanf(line + 5, "%lu %u", &mem, &ref_count);
>+			igt_assert(ret == 2);
>+			goto done;
>+		}
>+	}
>+
>+	igt_assert(!"reached");
>+
>+done:
>+	free(line);
>+	fclose(fp);
>+	return ref_count;
>+}
>+
>+/**
>+ * SUBTEST: xe-ref-count
>+ * Description: Check that an open oa stream holds a reference on the xe module
>+ */
>+static void
>+test_xe_ref_count(void)
>+{
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0 /* updated below */,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(0), /* update below */
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, 0, /* update below */
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	unsigned baseline, ref_count0, ref_count1;
>+	uint32_t oa_report0[64];
>+	uint32_t oa_report1[64];
>+
>+	/* This should be the first test before the first fixture so no drm_fd
>+	 * should have been opened so far...
>+	 */
>+	igt_assert_eq(drm_fd, -1);
>+
>+	baseline = read_xe_module_ref();
>+	igt_debug("baseline ref count (drm fd closed) = %u\n", baseline);
>+
>+	drm_fd = __drm_open_driver(DRIVER_XE);
>+	if (is_xe_device(drm_fd))
>+		xe_device_get(drm_fd);
>+	devid = intel_get_drm_devid(drm_fd);
>+	sysfs = igt_sysfs_open(drm_fd);
>+
>+	/* Note: these global variables are only initialized after calling
>+	 * init_sys_info()...
>+	 */
>+	igt_require(init_sys_info());
>+	properties[5] = default_test_set->perf_oa_metrics_set;
>+	properties[7] = __ff(default_test_set->perf_oa_format);
>+	properties[9] = oa_exp_1_millisec;
>+
>+	ref_count0 = read_xe_module_ref();
>+	igt_debug("initial ref count with drm_fd open = %u\n", ref_count0);
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+        set_fd_flags(stream_fd, O_CLOEXEC);
>+	ref_count1 = read_xe_module_ref();
>+	igt_debug("ref count after opening oa stream = %u\n", ref_count1);
>+
>+	drm_close_driver(drm_fd);
>+	close(sysfs);
>+	drm_fd = -1;
>+	sysfs = -1;
>+	ref_count0 = read_xe_module_ref();
>+	igt_debug("ref count after closing drm fd = %u\n", ref_count0);
>+
>+	read_2_oa_reports(default_test_set->perf_oa_format,
>+			  oa_exp_1_millisec,
>+			  oa_report0,
>+			  oa_report1,
>+			  false); /* not just timer reports */
>+
>+	__perf_close(stream_fd);
>+	ref_count0 = read_xe_module_ref();
>+	igt_debug("ref count after closing oa stream fd = %u\n", ref_count0);

Looks like the asserts are removed, so we will never know if this failed 
:). I think we should drop the test and create an issue to make it more 
robust.

Ideally we should take a snapshot of the entire /proc/modules file and 
ensure that no new driver has added a reference to xe while we are 
running this test. That way, we know that an assert may fail due to a 
new driver taking up a drm ref or dropping one. If we can attribute the 
failure to such an event, we can re-run the test.

Regards,
Umesh


>+}
>+
>+/**
>+ * SUBTEST: sysctl-defaults
>+ * Description: Test that perf_stream_paranoid sysctl exists
>+ */
>+static void
>+test_sysctl_defaults(void)
>+{
>+	int paranoid = read_u64_file("/proc/sys/dev/xe/perf_stream_paranoid");
>+
>+	igt_assert_eq(paranoid, 1);
>+}
>+
>+igt_main
>+{
>+	igt_fixture {
>+		struct stat sb;
>+
>+		/*
>+		 * Prior tests may have unloaded the module or failed while
>+		 * loading/unloading the module. Load xe here before we
>+		 * stat the files.
>+		 */
>+		drm_load_module(DRIVER_XE);
>+		srandom(time(NULL));
>+		igt_require(!stat("/proc/sys/dev/xe/perf_stream_paranoid", &sb));
>+	}
>+
>+	igt_subtest("xe-ref-count")
>+		test_xe_ref_count();
>+
>+	igt_subtest("sysctl-defaults")
>+		test_sysctl_defaults();
>+
>+	igt_fixture {
>+		/* leave sysctl options in their default state... */
>+		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>+
>+		if (intel_xe_perf)
>+			intel_xe_perf_free(intel_xe_perf);
>+
>+		drm_close_driver(drm_fd);
>+	}
>+}
>diff --git a/tests/meson.build b/tests/meson.build
>index 758ae090c9..288bb7fe79 100644
>--- a/tests/meson.build
>+++ b/tests/meson.build
>@@ -304,6 +304,7 @@ intel_xe_progs = [
> 	'xe_mmap',
> 	'xe_module_load',
> 	'xe_noexec_ping_pong',
>+	'xe_oa',
> 	'xe_pat',
> 	'xe_peer2peer',
> 	'xe_pm',
>@@ -378,6 +379,7 @@ extra_dependencies = {
> 	'perf': [ lib_igt_i915_perf ],
> 	'perf_pmu':  [ lib_igt_perf ],
> 	'sw_sync': [ libatomic ],
>+	'xe_oa': [ lib_igt_xe_oa ],
> }
>
> test_executables = []
>-- 
>2.41.0
>
