Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C59C83F1B
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 12:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250C410E81B;
	Thu, 17 Jul 2025 12:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MckILzOV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFE910E80F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752756794; x=1784292794;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=XxMSnS6ITUplWZUsqOP2SysXXS+M8DBfFfJzLwRYKE8=;
 b=MckILzOV4RSJixRTkQRItWBTXQc4g8qAUDE+4t3n3cH+O+wt7mUJ3wmj
 OOqos05Dib8s5lIe4Zvr0njhvOdTcF56GJ14biEdd+DiHy9E+P5zi9mqj
 Wnj39Qde7JxkncM9YxuzzZdlCkSkeNKIOXbixgT9IElgwOT4gFkozoK8I
 udqgIbp2SSPfkJgzlmIJ9KTTo1DaKzFuYIxyJNNkqkV+9wWMeXlphBM4g
 3Pqv68/9Ehd3RupoYgbEJmHhe/gcf/AAdge/NecgIw6MrX25jLNMI5mM4
 DWBaqM0Cviu1RR4dUhuaf25sfUpUDV5u+f3mwLy23/hc1YUcyToStnBUP A==;
X-CSE-ConnectionGUID: Cq51tARyQyKYsLJMasTSCA==
X-CSE-MsgGUID: h4gXD7kwSCexisurhuLKXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72596330"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="72596330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 05:53:14 -0700
X-CSE-ConnectionGUID: 8csGnfuDRaynUyeVJgLBYQ==
X-CSE-MsgGUID: sfh/ZqhPRZeRhh8bM5Bn8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="162084134"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 05:53:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 05:53:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 05:53:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 05:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYVBEI5/9ND+4CACmd+F6FbWJwOXtFW/gJ07VsP6a8ch7NOa68gAxGf0JMih0tDcOAZUs9qRwrJMRPQqw2JQx62anZSmnY3Q+yaf5OlQvvZ716EOhQV46iBO7cganixE2iA1GQzFdBRebjTpQR5XSltZ18LUDyiSjohZgIbfMdsvZvvv/izakUfCP/l6Zvjm+qoPcCul9Ro9tstkZF7BKQxsmXoLRsCLi+gsyCktyZcKenw4ZluRzUeyQEKodRGufs5fi2fT6QbhQJxwJEGIwT66ngaEXETbuMaxK/U7BvS6T1JY7zJyZBOXKKp+g0zraX/p+falonM8l6NdSBfZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oPxp4BUWdZEpgmHLDNayIZo9Vdrc0MXN8dcuuE+CgM=;
 b=ogjMyhtMOty5ZhNbkrBvQIUsJoIP0hirbhBr9t6PRDl+5El7g8mOLLsPbYg1k9xq0ag8aXwG4hi6xKE/bUBpK7T0GzswYxLUABwFHw3LJJGVG5yVis78iFMN+xc3uhkGvoIyOdCYSDTJWwk2y7Y+c77Fn1EDSCxHCK81KnEgLdoSs2e07SVxGzUSSxDkzSAeA7+ChHgrh55hj0VEvJRq0aBsRhUz7wvaaoncxfHijIP4nlVwadgNJ+JwqPMcck982fhg1k/vrjLeySUSHjMqt+yeyz5bohs25vvcoIndLXI28g5nuOjwr6ktlmX+JkO63hnaQk7O14z2R7MeLwh8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Thu, 17 Jul
 2025 12:53:11 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Thu, 17 Jul 2025
 12:53:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250716153102.165779-2-kamil.konieczny@linux.intel.com>
References: <20250716153102.165779-1-kamil.konieczny@linux.intel.com>
 <20250716153102.165779-2-kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v1 1/2] runner/executor: Build test command line
 before fork
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Thu, 17 Jul 2025 09:53:04 -0300
Message-ID: <175275678433.1809.10455527154698060092@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b3a4c2-bb2e-428e-9ec1-08ddc530e2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlNycmQvaE56bDNMOTdKb3g3VC9CdC9rVlJjcnJZK1VCMy9rK3pjcnFHRlU3?=
 =?utf-8?B?L1pGQzRsOVV3TjNHSUQwNzRZN1NrRXdGZDUxWUxuQTAvdVFvYS9xa0kxcjJN?=
 =?utf-8?B?Q1dhRkJkY1FkWXh4SEJXTDFvN3lRZGlTMW1TaWUzb0dWRTFTUTg5bFNlWWt2?=
 =?utf-8?B?Vk5tZGhSNlh4NjM2OUx4TjEzdmhURWRiL1JBeGRXdTdldEt3eXZmOGQvb3Jn?=
 =?utf-8?B?ZWEvRzBiREJnYk9UaG9wL3phcUFCZGIxbCtUQ0ZoaUdhUlZudS8yTlZaYjhS?=
 =?utf-8?B?VnBpay9MOFh2bGZGNXlFSVhHN0JkUWsrUjBKYUhwQ1VLVVl2THpRSGsvVjZy?=
 =?utf-8?B?RXVvRXpqRU1sUjUzemtWSDFCVWxNSExFNDA4Vyt1WEVwcU5EUk1TM1p3Y2J1?=
 =?utf-8?B?UkFrUUlqUnh2RmQzdE1JRU0vdVl5UUgxcFQxWUU2aU5GWTJzVlpVV3JGeUxG?=
 =?utf-8?B?TkJHcDJKaFM3cG91cmtmSEltY0VsdTgyQkxrbTBiK2Ewd2NXcTJmRHhTQ29H?=
 =?utf-8?B?SmxDUGdpK015Q1ZpeHNzR1p0YlNpbFBnL3Z4cU8vN2EzdXluV1BsL3N0bkhB?=
 =?utf-8?B?Tk9kUSswams5MDhnT2V6VE9FYjJqTWZ4WmFZK0cwbFJoWGtjay82TU5DVW50?=
 =?utf-8?B?MjRpTWg0dXZCRlpmQTJqU1NGdVFodWFOM0YwM0hjQVZrUERwNlluS25pOUZQ?=
 =?utf-8?B?eGlVdHVMYWFzSHBCcWRqZGFGWklzaC8xQitMclFIWU1IeEg1Wnd5QzJVN3VE?=
 =?utf-8?B?aE9sK3dFeTk5UW1CWlZ6bXlNenducjdJM2Z2K09tV0tJTmNQc2M0d0daN0Vh?=
 =?utf-8?B?bHMvY3pXTFJZaTdkSCtoQXhFZ0IxRXkvdjVzS3ZLVUNZZnJIcHE1U0NrRlZu?=
 =?utf-8?B?a294YTFaNkJ0Ly9STXhjS3l1WnpnREh5N29QejZEdDRDWUNTU0VNc1hOeGVq?=
 =?utf-8?B?S0lxRC80NmYwcTNXang3ZG9MVlBZZFAyODlrVzlPSmE1UFZlQ0UzTUx0UUdM?=
 =?utf-8?B?dzFEZWFHQmtIV3NlUldERElwdjZCSktTdCtrS255d0hVUEl4NHNVTFVoVitw?=
 =?utf-8?B?R2VWRFFHT0d1QmZESVRFYXRGYTJBNWs5VTdpSWk2ODF3d2dYVjdmaUkrOUhP?=
 =?utf-8?B?U0lYVmVEOFA0WEdUUjVQa3JhWUNUeXU5OUV6WmRWU0JYeUNQYXRsbmRDQlpM?=
 =?utf-8?B?VVZMSnBhbi9SL0l3eEE1ZWJLdlIwdG9ldXNtc2RzcDRiK01YTUNEWHJmM2hV?=
 =?utf-8?B?RVdYMFZ6M09ka2ZDNFZzN1dSUEVLWVVEemNhR2J3VHl0RkxMR2NGQzFFbTlN?=
 =?utf-8?B?Vnh0bTZMVDhKOEJwMWRTSW1sUTNoc25mb3FxNW90SHlKSE9OMUQ5Qmo2QTZi?=
 =?utf-8?B?YTgrcy9BZjJ1OFQybzdndVlwQUNSUitNQkdRYkZkUm1YVG9yN0NoWG9EMzB1?=
 =?utf-8?B?bmJJSTNOZmxjTlhoS0dvN01oTnpFbUpmWFJ0ZDZLdndTZkdpOXRPd3NXeWd4?=
 =?utf-8?B?NWJGNGg3cDVJd0lKQk5JbG1aVW5oQ2xnbHpmL2lYTW5ueXlVT3B5STk5WUVE?=
 =?utf-8?B?aXhkb1ZUSjJWV2I4OXBNd2Vqdzl5dDgxQ2lLVjRDU3RqOXV4V1Y0Y3NTZ0Nn?=
 =?utf-8?B?SnpnSm5xWWlGei9YMDB5cWdxYzlZQnlOcWcwL1phbmFBTzhlVVdTcitRd1Vv?=
 =?utf-8?B?aHRJN1dUS3ptVmhicWQ1alpHUmdjRlJwTno4dG9rOExTUEdtOCtFY3I5WFRw?=
 =?utf-8?B?Q1NzRWRnMm1OUnhsZEpqNFYzeUFqMGdyVE5FUkdyUWNQOUVYK1FRN2VMQ2FX?=
 =?utf-8?B?RThhczZhWXhIODFpMWZBRktSSzlZT0NnU1I3RVU0TjRiZktBd2xYZWdLV3Uz?=
 =?utf-8?B?bTlmZnZ6UnR3Y0Z1QWtHYjArYmNha0VlR2ZCbmhUdWxEOVF5QTA2K0tFckN1?=
 =?utf-8?Q?HIIp9wCkUro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm5ia3FXVjBYenhqK2JjcTUvV0dUSjhKWWZ0SlkxS295OXRqbmRDWlVzTHJP?=
 =?utf-8?B?MXdHMjBlZXFVSWJaNVFnTVNkL2kxVSs4YWowa1o3UTZJVy8xSzFhdXcxSmJJ?=
 =?utf-8?B?RVpkYjZEaUZ6SmxzUjQyVno1bisyZFREQ3BTejBtZWhRQlVORUs5S3pxcXRB?=
 =?utf-8?B?eCtPNXRlUWFadU5yMkozdmxOaXp1MDNJL0JBZGxQOEJlOUkrbVUwanBDa1hD?=
 =?utf-8?B?eEJXQmNHbEFVRUQreGtVVDcySlJTVTFqWThVRElKanVGTkVvS3R0VXhTVzZl?=
 =?utf-8?B?T3ZOWUxKS254T2xSMFVjMnc5UmZ6WkV6ZlRQTURXMklJQ3pXa3pzTmF0MWR6?=
 =?utf-8?B?QWE5WElKcTBGSlJnRFk0M1Rza1FZbFhoMHZRMlI2RDN5M1JlanhCelIvblk1?=
 =?utf-8?B?bjV4Sm51dTJYNDBaUGtJQU5BZC8vTXV0NnYyN1FUOTVLYWtlTU9nT01aMGdI?=
 =?utf-8?B?ajl3Sm5VY25idHUrM3RrM0lGakdYZmJlRGlTL2dYZmU4NE5LRDl3ckRHSm5v?=
 =?utf-8?B?NW1pbWthUFV2cWF3dFByMEJJNzc4TzZzRFpjQVduK2JSQTNXV0NUQlZyTFVT?=
 =?utf-8?B?U0dVa2hLTlRMRXpaRUJQZk5SVjF4cFNPc0x4TEFKZ1o3T3FPWmNDYmROM2c2?=
 =?utf-8?B?MXVHdklabzFvRkVhdTR2bVpRWTBJa2VmOTdTZVNXWHNQZFRBL252d3ZvRXdG?=
 =?utf-8?B?WFV3WndyZmFRcHRMWFRYZjIvVC9CdmRvelp3TEFLNGUvV1VWVVVzVUlqcE1W?=
 =?utf-8?B?dE1BSzRtTi9xSmM3aFZIZUpsSmI4ZGZKdE5TMEEyL1g3N0VQbm5SMWdhUkxG?=
 =?utf-8?B?L2E3QWp6WHdNd0xON2JFenlaZ1I0SXFyT2Q3YTgzbEZVOUx0bUxWQWp4Rzlv?=
 =?utf-8?B?NVlCdmpPOHhJK3RiWkNJSHZFeXlIRjZnOWsrTGdLVzZvUW4xSmE0WWhlbmZt?=
 =?utf-8?B?VUp3Szhuc3FLOWxtbzErMTUvaWVmamhOWGUwa3IwNTlvSHJFS05vSEd3WEl6?=
 =?utf-8?B?SUc1VlZQSVhhanZqcEc0dHYwVXl3RzYwRDdWbVJPeHdxaUhHMGxTaHZUSWgr?=
 =?utf-8?B?SDRVYnI0MmpTUkRCcmcxZHkveWdxczZsMmtObTQ2Z0l3cXFmNzVLRTZOcklD?=
 =?utf-8?B?cUt4Yko3U2xNVDdNZDhDT1dSTDdBUWN2NG4wdlV0SjdEUDdZTzVweTlzTXI1?=
 =?utf-8?B?alpNSXNOMUM3aE9rM3FxdmxLamtyNDhUU2xGY0JRWU1jMWdXK0FneDN4QnZE?=
 =?utf-8?B?Z2o1Q1hMaDhhTjJuMEdVNUEvK0wxK1AvOUFXNlRDa21XSWtIWndSdHVxTC9S?=
 =?utf-8?B?UDgzRDdSRi9IWXdaOW1QSGoxeERJYkRvT0JvV3dxK1dzWDZPOEpldnR2dXB1?=
 =?utf-8?B?NllLWUNUNUNjd00vVWswdkFORURkbnFuQldHekJiNFlIOVdpdjc4V2lrYUtt?=
 =?utf-8?B?a2s1blJDMWRQNG0rYVdTZjdKRW9zTVpFM25CRkFLWFU2cmN2WndTQzA5M0pV?=
 =?utf-8?B?Nk1SVDF3Q1VaeTVpcGhQZXJhL0Nqc25RNTFYbE00YUlBRG0vamU1bFNVdHZp?=
 =?utf-8?B?bG84eTE4NlZBd2cyRGJMTTNrVUViQlUxQ0JjYW4rTktEZkxndVNZVVNnY1B0?=
 =?utf-8?B?NXp4MzFUUnRSeE84Y2tPOFkwbHJZNldrUlQwU1dWNUlQWEhXa3h6RVdjM0pZ?=
 =?utf-8?B?R0pYai9UZ2ZIZkFFTWRpUXZ2STQ1dmMwc3RwQ2pudnh3dDlXa2krMDNGSU9W?=
 =?utf-8?B?UzltSTE2bzhsK3dUVUVQeDJaZVpGZGxLVE56VXFqd0ZVQTA1bzcrbWVRQkNO?=
 =?utf-8?B?TEYrZXZWSndLWVdiS2xTcjEwNkI3cDlHa05DRTkxNTBDNDVleWhWVWZ1bE56?=
 =?utf-8?B?TXNRR0gzdE1aeW9scWpYc2NDUDk4QUFmSGZXNlhpSmZ2Vno1SUllMDU0d0do?=
 =?utf-8?B?OWxiaWJKOXg4dDNnTXBTZitSajJvNUYxclNaNHdtUnZyN2ZKeEFhUE5vVFQ2?=
 =?utf-8?B?RnI2VUF4a2tqYUJ1RjhIWTZUWktITUw3MkR1WXM1SWZaODFEaWQ5b01RVmZ1?=
 =?utf-8?B?MURneFZuTFR0MytoOE4wZEYyZ0E4c0hTUnFEK0dTZlNmZW1CV2V2bFhOZkwx?=
 =?utf-8?B?dTFKOWF4NXVhWDFES1JlRzIrMGNGRVBUU3dkU1I4Zk1JM2pmYUNFZzh1RG1Y?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b3a4c2-bb2e-428e-9ec1-08ddc530e2dd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:53:11.5732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjCfJqBZbvemtTctWoFlYk7TKvEMTkaJS0v6lDmSpCjMrA8Ame71201Y5WeZKqJ3+IcmUPgKrkYLVpW/XGxV3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
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

Quoting Kamil Konieczny (2025-07-16 12:31:01-03:00)
>Create a separate test command line building in main runner
>process before forking, so it could be later processed for other
>purposes like reporting.
>
>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>---
> runner/executor.c | 64 ++++++++++++++++++++++++++++++-----------------
> 1 file changed, 41 insertions(+), 23 deletions(-)
>
>diff --git a/runner/executor.c b/runner/executor.c
>index 847abe481..7565f2571 100644
>--- a/runner/executor.c
>+++ b/runner/executor.c
>@@ -1615,28 +1615,29 @@ static int monitor_output(pid_t child,
>         return killed;
> }
>=20
>-static void __attribute__((noreturn))
>-execute_test_process(int outfd, int errfd, int socketfd,
>-                     struct settings *settings,
>-                     struct job_list_entry *entry)
>+static void free_test_command(struct igt_vec *arg_vec)
> {
>-        struct igt_vec arg_vec;
>-        char *arg;
>-        size_t rootlen;
>+        for (size_t i =3D 0; i < igt_vec_length(arg_vec); i++)
>+                free(*((char **)igt_vec_elem(arg_vec, i)));
>=20
>-        dup2(outfd, STDOUT_FILENO);
>-        dup2(errfd, STDERR_FILENO);
>+        igt_vec_fini(arg_vec);
>+}
>=20
>-        setpgid(0, 0);
>+static void build_test_command(struct settings *settings,
>+                               struct job_list_entry *entry,
>+                               struct igt_vec *arg_vec)
>+{
>+        size_t rootlen;
>+        char *arg;
>=20
>-        igt_vec_init(&arg_vec, sizeof(char *));
>+        igt_vec_init(arg_vec, sizeof(char *));
>=20
>         rootlen =3D strlen(settings->test_root);
>         arg =3D malloc(rootlen + strlen(entry->binary) + 2);
>         strcpy(arg, settings->test_root);
>         arg[rootlen] =3D '/';
>         strcpy(arg + rootlen + 1, entry->binary);
>-        igt_vec_push(&arg_vec, &arg);
>+        igt_vec_push(arg_vec, &arg);
>=20
>         if (entry->subtest_count) {
>                 size_t argsize;
>@@ -1644,7 +1645,7 @@ execute_test_process(int outfd, int errfd, int socke=
tfd,
>                 size_t i;
>=20
>                 arg =3D strdup("--run-subtest");
>-                igt_vec_push(&arg_vec, &arg);
>+                igt_vec_push(arg_vec, &arg);
>=20
>                 if ((dynbegin =3D strchr(entry->subtests[0], '@')) !=3D N=
ULL)
>                         argsize =3D dynbegin - entry->subtests[0];
>@@ -1667,35 +1668,49 @@ execute_test_process(int outfd, int errfd, int soc=
ketfd,
>                         argsize +=3D sublen + 1;
>                 }
>=20
>-                igt_vec_push(&arg_vec, &arg);
>+                igt_vec_push(arg_vec, &arg);
>=20
>                 if (dynbegin) {
>                         arg =3D strdup("--dynamic-subtest");
>-                        igt_vec_push(&arg_vec, &arg);
>+                        igt_vec_push(arg_vec, &arg);
>                         arg =3D strdup(dynbegin + 1);
>-                        igt_vec_push(&arg_vec, &arg);
>+                        igt_vec_push(arg_vec, &arg);
>                 }
>         }
>=20
>         for (size_t i =3D 0; i < igt_vec_length(&settings->hook_strs); i+=
+) {
>                 arg =3D strdup("--hook");
>-                igt_vec_push(&arg_vec, &arg);
>+                igt_vec_push(arg_vec, &arg);
>                 arg =3D strdup(*((char **)igt_vec_elem(&settings->hook_st=
rs, i)));
>-                igt_vec_push(&arg_vec, &arg);
>+                igt_vec_push(arg_vec, &arg);
>         }
>=20
>         arg =3D NULL;
>-        igt_vec_push(&arg_vec, &arg);
>+        igt_vec_push(arg_vec, &arg);
>+}
>+
>+static void __attribute__((noreturn))
>+execute_test_process(int outfd, int errfd, int socketfd,
>+                     struct settings *settings,
>+                     struct job_list_entry *entry,
>+                     struct igt_vec *arg_vec)
>+{
>+        char *arg;
>+
>+        dup2(outfd, STDOUT_FILENO);
>+        dup2(errfd, STDERR_FILENO);
>+
>+        setpgid(0, 0);
>=20
>         if (socketfd >=3D 0) {
>                 struct runnerpacket *packet;
>=20
>-                packet =3D runnerpacket_exec(arg_vec.elems);
>+                packet =3D runnerpacket_exec(arg_vec->elems);
>                 write(socketfd, packet, packet->size);
>         }
>=20
>-        arg =3D *((char **)igt_vec_elem(&arg_vec, 0));
>-        execv(arg, arg_vec.elems);
>+        arg =3D *((char **)igt_vec_elem(arg_vec, 0));
>+        execv(arg, arg_vec->elems);
>         fprintf(stderr, "Cannot execute %s\n", arg);
>         exit(IGT_EXIT_INVALID);
> }
>@@ -1772,6 +1787,7 @@ static int execute_next_entry(struct execute_state *=
state,
>                               char **abortreason,
>                               bool *abort_already_written)
> {
>+        struct igt_vec arg_vec;
>         int dirfd;
>         int outputs[_F_LAST];
>         int kmsgfd;
>@@ -1821,6 +1837,7 @@ static int execute_next_entry(struct execute_state *=
state,
>                 lseek(kmsgfd, 0, SEEK_END);
>         }
>=20
>+        build_test_command(settings, entry, &arg_vec);
>=20
>         if (settings->log_level >=3D LOG_LEVEL_NORMAL) {
>                 char buf[100];
>@@ -1871,7 +1888,7 @@ static int execute_next_entry(struct execute_state *=
state,
>                 }
>                 setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
>=20
>-                execute_test_process(outfd, errfd, socketfd, settings, en=
try);
>+                execute_test_process(outfd, errfd, socketfd, settings, en=
try, &arg_vec);
>                 /* unreachable */
>         }
>=20
>@@ -1890,6 +1907,7 @@ static int execute_next_entry(struct execute_state *=
state,
>=20
> out_kmsgfd:
>         close(kmsgfd);
>+        free_test_command(&arg_vec);

Since arg_vec is built after kmsgfd is opened, I think it would make
sense to call free_test_command(&arg_vec) before close(kmsgfd), to keep
it consistent with the "stacked" approach and avoid any gotchas in the
future regarding ordering of operations.

In this case, a rename of the label out_kmsgfd would also be warranted.

--
Gustavo Sousa

> out_pipe:
>         close(outpipe[0]);
>         close(outpipe[1]);
>--=20
>2.50.1
>
