Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264AFEB5969
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 06:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C538310E0A5;
	Wed, 11 Feb 2026 06:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8S+MxSj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3622C10E0A5
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 06:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770792202; x=1802328202;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eHaQdeSCeStLYldJ3tQMclsxEPKcl6YuHPRvFKIDgQc=;
 b=Q8S+MxSj4OJHHO6VnTXHY5vbkRE4a+BIsKfdOvkIXEurfy8Hc/45FUJ0
 0eP6g8HIjSDTNt5fK8O4chNjVbkoVPI09OR6JOXutLeyizrrkirnki42b
 XK6lVhbGhaZv6G8cmujmcpsMM2PdaMj1TKiAvvourAW0hcDuHOhZvhM8p
 hCWSTmCuv36vcHG9zh+D0q33xRJrKAMtFyiOOJ4GBsaz4fOQbxtaaQUxl
 iv63t3rYJ3FWpKMRh3sizliz2plbrNj7KLkTejEHk2NR+4E5dqUbsybkH
 qEzwZt5szJPKYx0kEmdNCsulP7JyvpqQTjVwjlrHSi8oVnuHiDWVYhLb4 Q==;
X-CSE-ConnectionGUID: HOa8g/Q+RBuDq7JJBrE0NA==
X-CSE-MsgGUID: 5bWQQ/2dR5Wf3G/zibp/jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71834066"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71834066"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 22:43:22 -0800
X-CSE-ConnectionGUID: ywGWFkXVTBOqnrOzxU5eRQ==
X-CSE-MsgGUID: dnekRH1rT/aO5BMDPH289w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211572134"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 22:43:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 22:43:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 22:43:21 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 22:43:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7O66l+EUyNvHm8a8oGZ9ZV3vMkpotIRQW+mFR8hc2ph3xabQuhNFKBCsv25bXvoPfBndsmbSrKNQmAdGSBcmoSSEPXFeMM177U4RQ+ROLdQEMpg4lMZ58F02ukctzJP4Zu9HhPmpGaLB1bJ2O/fZfyb/LDD7HFFv7oUjv+KcmeAu01PRTD8PxvKE4XjkQVDZNb/CFx9KvjCFKlt/+FCUxb2gxyaAPzeHAuZAjJKKZsCCH4jxvHWi8oMoCMyJA+Qn2x1vTSbGS3Vhj1wr6M0kumBLa74cYH17zgFNe2bvEGWowcBfmvbJp8Vh8HjqCZUwvwEh9ajyPM6ec66k+Tb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29YLWqWG2EJNaIAHLtnI2K/rOOTjXvQqUXQe7eqzz88=;
 b=fRTbeEFJaK5w6EYPrC3ulLQwAbxeS0i86naJ2drw7EBEztwySaVv14Q1zIrHCysJ0dTZpMxtZth4EFx9GLZl68ij5C0TjzbGyr1fgbHufku4adKsMPhEVZX8fSPKqpZPHy0NhcVORffJLFOfAP5MPvl1Q9C6kQFalapNc0Vb9a/3A1xtHvX9ugO5dkEog6Ktix4CRR4gkXQA5ZSbVbfT/a9ghGxdGA11+5ZJXzrw/MkpOESfiilw0QYR95pQviHJgiEm/coBbP99dTds8oe8RDVR3E05sYk4CQ64akBv5H9T7+bI+Fe27Tw0pxwWWoZCFuzZPXcSKWkJRTBIa2ZdHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 06:43:14 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 06:43:14 +0000
Message-ID: <e521f0c2-dccc-47f4-94fd-e3f1c94dee1c@intel.com>
Date: Wed, 11 Feb 2026 07:43:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 7/7] tests/intel/xe_sriov_flr: Skip xe-vfio-pci
 load/bind when IOMMU is off
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
 <20260204163217.121305-8-marcin.bernatowicz@linux.intel.com>
 <17a502c4-87ec-40dd-b45f-72201485bc16@intel.com>
 <bf66b0d7-d0d6-466e-ab9b-f6bc60cf8dec@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <bf66b0d7-d0d6-466e-ab9b-f6bc60cf8dec@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::15) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH8PR11MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2f6211-69a1-4b20-0f1c-08de6938d499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWtpNWcyOFc5LzQ5YnRid0lrQ0ROM1grdVQ2SXYwc3lkT1NUZDNOUUg1QlEv?=
 =?utf-8?B?WTZpaktvRHBlOWZVUGxpYW93Ny9ybW5xNXdHL2VJYy94MklkalNUaDlISFdY?=
 =?utf-8?B?bVg1RS9vYTQ0M3BMMFU5R3h5RDh1Vm1qUENGenEwcnA5U3ZDdXpPdDEyR1A5?=
 =?utf-8?B?cmYzb01SaHMrak5oYjhzRzZyNHMrOG9CY1dHK2puR3VJem1oMXYzMnQwTEZX?=
 =?utf-8?B?Y241ejdtczRsZnN0Y1lTenpiNnRlZ0M5QTM1M3pNb1FKMWNZQkNNa2xnUmxO?=
 =?utf-8?B?TUc1REE5clF1WVRlWkJVcTd3cFdRVGRPaEl2YlpydCtuZVBYM0VaMnhJWTB4?=
 =?utf-8?B?MlZ5VnB4REwzK0w5bEtKNzZ2MEhTLy8xMUgvWk10cmhrdlYzVG5DdGhkRkR5?=
 =?utf-8?B?WkFuOGkrWW5TeXJCNWRLb3krb2JMc0pVRHJIYys0bWRaQkdrRkkvQnc1OEZh?=
 =?utf-8?B?OXE0K29JTHM4aXhIaEhadDJtL3hQMFA5a3J0NDZXdjNXamJXaHdTbzJvZkw2?=
 =?utf-8?B?ank4UW4ySDlUZnVFUjY5UTk2ejFtejRTU2RWSG1rcEp0bUhPWjdCZ09hRzJ6?=
 =?utf-8?B?MmVERGFoTkpGM0hldlU0V2NkU2ZJTDlHRTZ3aVJvREx3empCclNSUE1yVnZi?=
 =?utf-8?B?bG5KS2xURmhidlZYR2VYZWk0djRGaUNic0FNS2h6MUJJUzFBcnRMMHhGRFVM?=
 =?utf-8?B?RFZrUzJVcXk3NitNUzViUUY0L0ROTWdSM3RTcDBzNnNSbGhOV2g2RDh4eEVP?=
 =?utf-8?B?aWRqTTcwbXdkRVN1S281SWRCZHI0ZWhVZkxOYzN6WEw4MlZTcXlrS2Y2cXh6?=
 =?utf-8?B?b3ZYUk5SRGRpRjlFMzRQZ1pNRzV6aHkwQXk4SzZPZkZSNkVjWTlYMTh6QVQ5?=
 =?utf-8?B?dHp5OEhFRjIzSXNFcjZTVGdnNDVJVWk2alo3VGxEeG9zelRGZ2FXQmlFWFlj?=
 =?utf-8?B?VHR2NHZ6RFQ0NGNEMXJVbU56Y3YxS2hxRWh1TUZubVpkM3QxV3RLMGExMFNV?=
 =?utf-8?B?T1l3Z0c3UkNtWE1SdGxkL3JLc1pFUFpQdjF3cnd3U1dWdmtyK3BzNFNQR2ND?=
 =?utf-8?B?K3Y3M1pkbWE5dktrekg5K2lxaEJLK3BVeGRTZzR3WE1raDhnaCtuZ2FhWFc1?=
 =?utf-8?B?UHNydWhDMUlBSGVIZ2tHaUY4bDFhMERCZUVVOE1zU05TeGovY1AydGpNclVG?=
 =?utf-8?B?cytFTFMxWFJDblhQTmUrM3VtSWVYZGRnMnVwVGxQenBvdzVWcE9xQkZHS0JQ?=
 =?utf-8?B?VHVsTkpMelZCSkxzVUl6ZjZobWc4Vy94dVZjTU8rNkdSaTE1UnpoN25pTENv?=
 =?utf-8?B?RXhpTEJ0MXhYa2pQa0oxRDh0Tks5Vi9Yb1pwUTB4cFppeitSY1ltTlJvMWts?=
 =?utf-8?B?K1ZXZFVibWFJM3V4c2RoQ2VzaWxaRjEyb3NZVklaMTZudDlxQ1h4b2ovQW5n?=
 =?utf-8?B?NkVNQzgyaldFWnVwczZleE8zRERteTBZUklxeFpNZ0w0TUIwaGQrdXpWSEp5?=
 =?utf-8?B?MUMyTUY0OUUvZVRoUXMyQS96ZVlXOEZjTFV1cHFSSmcwNWxaUDJXNWlJN294?=
 =?utf-8?B?Tnl5RFgvaWRZRGNQaHU2ZGNrNmVrMjlKYmhVK1JBTTlzRU1acFZhWnpaNVBu?=
 =?utf-8?B?QXBHdzVjd0I2LzJQSml2Y3htc0xZQWVYQlJCTHc5bEVSZmlpanFUblVTblpR?=
 =?utf-8?B?RVVoWUxxMVM4OEhjcmM1bWlBUjl4QWlNMU5PYkNDZXdjSzN0UmFQZWlZeWpr?=
 =?utf-8?B?YlY4VXNUK3RaU0IyUHh1UTZTcGtnMGIxS0toZFgzWEtkTHZwajA5c3FEMmlR?=
 =?utf-8?B?cERJWEtyYm90TUp1Z1gzYmFOVUxneksxSzMyVjZ2SGNDS0VHZnlUWVVxbVVP?=
 =?utf-8?B?M0NkZ2pHMThFYS9tejQwRnhqU0ZHMlU0QnBrcWY5VHEwMzBTd3BkV2hoUUVq?=
 =?utf-8?B?SThyeVJUY0xKekdwRzBBcmNmMDMzTkRuc3JhNjNROXN5Zkx1U2k5Q1dkZ0Vz?=
 =?utf-8?B?KzhZSlE3ZlBJcjhRd3pvOTZSZmtEVzV4eGE4UTdTaWhWT0F5WjNCWUlZMVM4?=
 =?utf-8?B?SWhqWmJFd1JuWmF2MEttVTlxQzN3YmpJRktXMEE3RlU5V1UyNnlaMEtiRnFo?=
 =?utf-8?Q?hVM4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm9qNXVGZnF5SkdiU284WmhqM0ozTzJQNmtXV1lwakx0czFzdnRtR3FnRWs4?=
 =?utf-8?B?WFo5dzBEVFlnMFFLOFI4L3VoNG1hQ0NqRUZrUWZLREo5Y1NBcWxCWlhrMzhp?=
 =?utf-8?B?ZVprdUFwZUdnTmNrdCtJM2ZsTStRMjlXOHdER0dUYjJpZEpjZDVwUTRSNlR3?=
 =?utf-8?B?eUVBNEMveCtaWGJFcXJ4NGlWZ3ZOb2psVTEvOHYrWE9PamRIVmhmK2x4MFBv?=
 =?utf-8?B?UU11ZXFuWnV1aG4ycjhKRG94R3dEa2tPekVmYmJLd1RZdGszc21udzl4SWsy?=
 =?utf-8?B?RHI3S21LaUtxY1VNcXh6SmVEVEVjcEdQcmRXU0N4LyttOHhrUnNxb29IaDBO?=
 =?utf-8?B?ck9rdzNwc2ZIcThQWmxWWXZnekNQZW9oaTc0Nmo1bW1xbW9OTGdVZzZINFUx?=
 =?utf-8?B?QUEyb0dxUGVlTm9HQVNMdW9yelJrRWVZK3NhbVF6elh4MEgwVThRZnRnNmtN?=
 =?utf-8?B?Y0xTUUVQMDRsdXAwcUEwLzQwV0Y2Q2hSbXdCcGdrTUM3RVl1Z2k3aWZRUWxJ?=
 =?utf-8?B?aTFlcXVtZXNWNnlEREZTaVkxQkRvZUxMWXdtR1BpeUZZVG4rb0tzZVlwSS9L?=
 =?utf-8?B?Vnp1Q2YzOEFkamZZenVyK2JVS0Zra3ZsNituU1JHZmtHUXQvY2ZvbUVSQ3pi?=
 =?utf-8?B?RlUweThoM2lWY1VyOWRiL2Y1NWtHOTBmeVR6dGh2dEJnVjFCRFVEcXlLV2Fx?=
 =?utf-8?B?M2tkMkw3UGtQM0FBYVBsdHhHVTUxTzdVYkhYRzJYN05VSW5UcldNaHNnWStT?=
 =?utf-8?B?WWQvazA4NEk3UGxad1Q1Q0h2OUN6QXJkZmgzZ3FNVE9wUmQxVE1GN3JxcmdD?=
 =?utf-8?B?QThQelcybkZTZ0IrdVBDY0hZZDBiNEU2OVg5SUc0YU92Qm1rd2FFZ0Uybmhq?=
 =?utf-8?B?VTlzZVJqY1RwcndqU3htWHVSRllzMEZ0bGJnYkZXajgwL2RXNzV4aHhreWFY?=
 =?utf-8?B?WnB3SnV1eksyRUtHWjBGb3JGSklQTVVPcGVpY1dINm9FWTh3ampkS1VnSE1D?=
 =?utf-8?B?Tm1CZ3dCQk9XZm5yUGdRcFFyanhVT0JLMWU2ZW12TGhGK0libnB0L2h6YmdD?=
 =?utf-8?B?UktjcWxWb0lGMUQ2blJUaDZqV0NKSzJ5TnhnUUxYKzc1cXdKRFNKajJ6d2E3?=
 =?utf-8?B?NGlGWlo5T2h4VHkzTGhQTWx0U0FwcGJDUU51b2lzOVhaZmNkSzRJd3RHZldx?=
 =?utf-8?B?L2xaQ3AwZm9DZ3Mzb2dONDc5NTRHOUlmSGJCb3lFejd6U1JQa1NEd0JKRDRI?=
 =?utf-8?B?RVUvWXhlNE43UDBZZk1kdFJQTFdHK2FtaVR2Yk5kVUxQc1ZNdjdoTnBrOVhz?=
 =?utf-8?B?bEFiRFRaTy9ZdHkyT0ZNTlFpOE1OREZzVFFFUTMrZWQveExnL3FLa0k0SG1S?=
 =?utf-8?B?UUR2Z0tmS0NkY0Y2OVdkUVQ2OWhxTnVUd0xDNEdKTDBaR0t2dkUzVnBTWFhD?=
 =?utf-8?B?RlFGM2E0NElwSjVvWkdHV2hqZU1GVEhJLzYyMU9ybE00MjlZQ3M4SUc0MDNF?=
 =?utf-8?B?cGhDWDNUU1ZXZlA5bWlsYmJKS0NjVVNrbDc1bVNSRDh0dDVwSnp6aXptazBU?=
 =?utf-8?B?UVVDdkZJdlNaL0dqSzRJMldUWTlITGZsbTQ1Q21hdGdLZWJMa0hIL1ZOZHdI?=
 =?utf-8?B?Y296MnVyaEVRYm5rRjJHWE1oczIvQlVHbHBhS0pJbG80ZTJ6ejBQSEdvdlRG?=
 =?utf-8?B?RWVzTElnMTJSK3phbHBJc21pTUNQbTQzcjRSZzVRVmVON0N1a0NIWWROZXlS?=
 =?utf-8?B?WnlVZzMxaGVlc2hTNHVKWHZGNktvQzI1eUxiQ2VzQytzRjZTTFhXNDlwWjV1?=
 =?utf-8?B?a2VkZC8ycmtXS1pBeFBabENHL1Z0cUR4ZUo5TUxpbVBUTC9ydUJyaEczUG52?=
 =?utf-8?B?UStkUFJWblhSVVJ4Y0xta2JaUmhkOC80dzc3SXptRXFKK2JZMmNEQmNnTHNo?=
 =?utf-8?B?RGxUMDg2RXkvZ0lDMmpTcnJmSVpIZTgvSXVTcEZCQ3ZBOVRJV2Evbzk2UEZ6?=
 =?utf-8?B?eTl5Yy9XMmprL0Z5QjZRbU03TGNmczlVbnBUdDNwME9iVnNxbGlFRkVyaFp2?=
 =?utf-8?B?Y1pFaVlta1dQRzZuWlMra0oyQkNPZ3BqaXN2SmpLWUU4N3VFVFBkNjZTMERQ?=
 =?utf-8?B?VDhpVU8ycXdaVGJPRUIycXJJdVg0Wk5LS09rbzcrUlUwQlowSndxYWxFc2xk?=
 =?utf-8?B?aFhPaDNQQlQxMktUVU1lb3N4SXJRZ2tuZTJVcmcweXp3b0RGWGQ1V0ZtQ1FZ?=
 =?utf-8?B?VGNRRDlCdEZBZFJNQjUxSDYrVXIxeUE3dTZ3MFBqNjcxdXdCdEhnT1pqNjJS?=
 =?utf-8?B?aExkb296MDFzYlQ0cU02azJNQTYxd0doYndQc3BrNWFDQmhzNU1yUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2f6211-69a1-4b20-0f1c-08de6938d499
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 06:43:14.1322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aM3FwHDa75edbVb4tpEfcwbKehiiMHXRzfmT9zhUSGiZGfL8gjOdl7iZUEBwhHBeCGJfyJ7vffN8ZU+C3uE3dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
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


On 2/10/2026 12:23, Bernatowicz, Marcin wrote:
>
> On 2/9/2026 11:42 AM, Laguna, Lukasz wrote:
>>
>> On 2/4/2026 17:32, Marcin Bernatowicz wrote:
>>> When the IOMMU is disabled VFs typically lack an iommu_group, and
>>> xe-vfio-pci binding may fail. Skip load/bind in that case.
>>
>> I'm not sure if checking for IOMMU groups is enough.
>> I think it's possible that the device has the IOMMU group and 
>> vfio-pci still fail to bind if e.g. CONFIG_VFIO_IOMMU_TYPE1 is disabled.
>>
>> We have a control on the environment where test is executed, so I'm 
>> not sure if this patch is needed. We prefer to use the approach with 
>> xe-vfio-pci, so if it fails because of the system configuration than 
>> I think it would be better to fix the configuration.
>
>
> Maybe it's good time to add xe_sriov_vfio test with some basic checks:
>
> igt@xe_sriov_vfio@load-xe-vfio-pci
> igt@xe_sriov_vfio@unload-xe-vfio-pci
> igt@xe_sriov_vfio@bind-unbind-vf
> igt@xe_sriov_vfio@open-basic
>
> ?
>

Sounds good to me

>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>> ---
>>>   tests/intel/xe_sriov_flr.c | 43 
>>> +++++++++++++++++++++++++++++++++++---
>>>   1 file changed, 40 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
>>> index b73727787..3fc84bbf9 100644
>>> --- a/tests/intel/xe_sriov_flr.c
>>> +++ b/tests/intel/xe_sriov_flr.c
>>> @@ -13,6 +13,7 @@
>>>   #include "igt_kmod.h"
>>>   #include "igt_pci.h"
>>>   #include "igt_sriov_device.h"
>>> +#include "igt_sysfs.h"
>>>   #include "intel_chipset.h"
>>>   #include "intel_vram.h"
>>>   #include "linux_scaffold.h"
>>> @@ -325,6 +326,44 @@ static void vf_unbind_driver_override(int 
>>> pf_fd, unsigned int vf_id)
>>>       free(slot);
>>>   }
>>>   +static bool vf_has_iommu_group(int pf_fd, unsigned int vf_id)
>>> +{
>>> +    int sysfs;
>>> +    bool present;
>>> +
>>> +    sysfs = igt_sriov_device_sysfs_open(pf_fd, vf_id);
>>> +    if (sysfs < 0)
>>> +        return false;
>>> +
>>> +    present = igt_sysfs_has_attr(sysfs, "iommu_group");
>>> +    close(sysfs);
>>> +
>>> +    return present;
>>> +}
>>> +
>>> +static bool vfs_have_iommu_groups(int pf_fd, int num_vfs)
>>> +{
>>> +    for (int vf_id = 1; vf_id <= num_vfs; vf_id++)
>>> +        if (!vf_has_iommu_group(pf_fd, vf_id))
>>> +            return false;
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static bool try_load_xe_vfio_pci(int pf_fd, int num_vfs)
>>> +{
>>> +    if (!g_use_xe_vfio_pci)
>>> +        return false;
>>> +
>>> +    if (!vfs_have_iommu_groups(pf_fd, num_vfs)) {
>>> +        igt_info("Disabling xe-vfio-pci binding: missing VF IOMMU 
>>> group(s) (IOMMU off?)\n");
>>> +        g_use_xe_vfio_pci = false;
>>> +        return false;
>>> +    }
>>> +
>>> +    return igt_kmod_load("xe_vfio_pci", NULL) >= 0;
>>> +}
>>> +
>>>   /**
>>>    * flr_exec_strategy - Function pointer for FLR execution strategy
>>>    * @pf_fd: File descriptor for the Physical Function (PF).
>>> @@ -386,9 +425,7 @@ static void verify_flr(int pf_fd, int num_vfs, 
>>> struct subcheck *checks,
>>>       if (igt_warn_on(igt_pci_system_reinit()))
>>>           goto disable_vfs;
>>>   -    xe_vfio_loaded = false;
>>> -    if (g_use_xe_vfio_pci)
>>> -        xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
>>> +    xe_vfio_loaded = try_load_xe_vfio_pci(pf_fd, num_vfs);
>>>       if (xe_vfio_loaded) {
>>>           vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
>>>           igt_assert(vf_bound);
