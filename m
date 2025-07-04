Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326EEC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 10:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A8310E9DB;
	Fri,  4 Jul 2025 10:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFGOpxtP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDF410E9DB
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751623357; x=1783159357;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lWIC1jEmRKoX6qXYpV2HYjt4siBf/aP4pyqOLWkj12Q=;
 b=NFGOpxtP7sNEDVxqXVxCrOPqyoC/F9kZtPfX3hit7MEHlM3B+qlZLFMg
 4B0lB+mtA3kP5CBNR+qPORV+ArF2PjL/311S1Q0nZ2sFvbUcAEP3PedKk
 xcbddtYIiHPhyAof5O6n2CpkkFNUFldPc8iKHEKqBCD3ajI4fLom72Ydt
 YhNhtt8vG79h9DhMRaylmFMjU+OLgekqZpyAHvp1wC86Xy7vez9kn8OaD
 mFxkz/TwO3RZV8C1QguaGgPNbGcLNaX/aRMp+DFmqr4y8T+afSt6JMo36
 tEf+u1GsNM5MvuNysgotjOI1ictjww6RYErRxZk180gX4Vy/LfvL58gJS Q==;
X-CSE-ConnectionGUID: 7lzAmLjfQie7wTHhUfE5Ow==
X-CSE-MsgGUID: I2PwxoLUSua6HOvbCGwtdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64558095"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64558095"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:02:34 -0700
X-CSE-ConnectionGUID: UVyc6GBKRwS/kc5zLq/ncg==
X-CSE-MsgGUID: Wjl58RHQRWafdVUkJPdsFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154019207"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:02:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 03:02:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 03:02:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.87)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 03:02:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpktQFYqoV/2Qd8aN/nEUOwm2VnpXISAiGyRiclj9DOz16lrxE8bSXJmBLOQI9/pqutvpbmoOvXYnufC74HowkDY46EwNvu2Edw8KZ7IzMigoQ/DwcNCSo+nQFJh3WuykAWrwIxu0R4Ga5Q52fkpvraGMc+xHaV41wlGBqgOT0jKiQMCtYEfifM26hxNZJwm/h5jhuMnWvH1N3eMFewX7S2cLvCWAEza9aCIG9yQbJ5hRlzpPf1FVJib3KwnusDjcPBY2pcOZNWaTC3QXIMJ8e1zjZ5vKZfrM9prLGgVU96WYiDWwDH52Hx6N6AFsVjsNu0GKG/t87KgRNQFQMtrbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWoPELFFT2Yz/2vhIFWhtmndwf3i2tBtrBY1seL5ljs=;
 b=uric58xKKPxZOvybIxVZCxI5eDAnLubHgVnytLKmKBqb+Z7V5VjpUAU9bENKK01E0bPnSA2Pm4eQ7I9qrMdBEbNFAMf/TaLwcNsLQDK9X+ZYF1ON1gVOLNr0PsxutUwm/s14wALEp/qP8+Ge93Y68UfrE73EBhJgdgBajcMAhNe/3qJigBz3ROqI3OzTQus6n0CfniTgoUkaaIQe5PW2S8g8NeGKeX4vyfbh66PWkAqhgpnK0qFPytT8KGMwWXxGqwguNk+T+0ZBb09rIHODwpHfcwIf0qmGh1DvWSLDM6EPiFfpNvR7JYVZlJUY7876vU/uIcvuXHNkPjuFzsWrGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 10:02:14 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 10:02:08 +0000
Message-ID: <682d75c2-4f47-4a6f-9120-28e6d6eba63c@intel.com>
Date: Fri, 4 Jul 2025 15:32:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 resend i-g-t 3/6] tests: Add core_debugfs_heads_power
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 <michal.wajdeczko@intel.com>, <marcin.bernatowicz@intel.com>,
 <kamil.konieczny@linux.intel.com>, <katarzyna.piecielska@intel.com>,
 <zbigniew.kempczynski@intel.com>, <ewelina.musial@intel.com>
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
 <20250616074240.45818-4-peter.senna@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250616074240.45818-4-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: ae76c33d-d758-486c-38e0-08ddbae1d624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akhZSlFqWmZOSVIyL2hvMWVzeFVNYkNXSk5SdkdkYUtIV0VhdTB4enJWa1lD?=
 =?utf-8?B?cmVQeFFCbVE0cGhmM2lPRHdJS0FzSC9JTXlmQ3hOYW8wbG1tQngrcmVzK1VE?=
 =?utf-8?B?OWFmc0tuTGUvRFg4US9ldXVhcE1MZmRXd0FHaXZFMVpYMG5LZjNtd1YyQjlV?=
 =?utf-8?B?WXMzYTBGWXo0aUZaZmY2TkdDU1lzZWdvRVF6SXFDb0VUTFRvYkg1c1pzZmlD?=
 =?utf-8?B?NEVpV2xONG12R2Vaamk4cFlUVFdNQXN2VVhGWTBPRkhxOGZnMWRBeDJNdjBl?=
 =?utf-8?B?RG9tWDU4aURQbU91MmJIU1pwY3AxZTEyUTdGd000akxqODZWenBLWURrbE93?=
 =?utf-8?B?WlJjbXVvUktYTXJRQ3FMN1QydU10K1FOWFV4SUJRYWpMK0YrRkdGZXl3eGZU?=
 =?utf-8?B?VEU4TzZzSSsySzRXV0szSzdvRE9ZUnRUb05nWi8zdmxGbElJVDlBUmJUUWlU?=
 =?utf-8?B?T1d5dURnaG02Qk04ZUdyRWFnellvdzZPRVVJeW5QNW9ONElSL1krVk5HeDVh?=
 =?utf-8?B?cXVKN0pjUC92SFlzMjIremRBWDRTSUpXVHNDRi8wMEFjT2xMVTN0NjhqeFRm?=
 =?utf-8?B?YWZ3T0VRVWFHVnY3b3NpNzRJM0lrZk9nakVLNVNmMU80aWhIblhMc0tWenp0?=
 =?utf-8?B?cFZTREVGaUxUZ2FjbTFOYlVyTFdaS2hpWDRKZjRNdVY4N0VmQ1NEc0tTTEhF?=
 =?utf-8?B?N2xCOGEvUm00NTdXeDBQbG9rMkhjMndRelBPZEVZWWpJeEIrbW9nUXdNcVZo?=
 =?utf-8?B?a0tVWmZRLyt1RENvTU9nd3hJczFhYXpFY1o4RTA0VUd1ZUNDV01CZndnVER4?=
 =?utf-8?B?WGZMMEZXRytHVzM5OW9sMVZPR0s2MCtKSnROSzRUQVhzQWNhZ09EZ0R3c2RW?=
 =?utf-8?B?dTVXM2JlRldyaVJPZC9WcDRpR3VZa294Y0UvU0F4T0d6dFlncTJWM1REMTc1?=
 =?utf-8?B?TkZCYlVCdVF3Njg5SmJnY0UvbGdmajBrb0N1L0Fld3JpZUR1U2FKSGNWSDk3?=
 =?utf-8?B?L0I0MzFVTXZFTm94TDhzenBzQ1FSZUFJNVVDZHFxNkk4NUlTd280c2xLS3Rx?=
 =?utf-8?B?WHg3U0xVQWYxQVNyY2t6YzdMNGRxUjZyNVlkYTg0cC9XaDdsdU5mcXBjY3dB?=
 =?utf-8?B?WFpaakRaZythSndDdXRVc3g4WGN0eWdzTzhyanNtL1A4eWx1NFBYM05uOXFY?=
 =?utf-8?B?MEd6Tno4QXp4dlJYbFJpRXgyNGtSMlZNRWlJWTRoVlA3NzRQN2xzcnh3djhr?=
 =?utf-8?B?czVRVVc5dEp6U3FuNTBGUW5KWEtQM2kxNkd1RlIwNWlYNktETnAzM28rT1dO?=
 =?utf-8?B?OWxMTWNnNmxicENoVlV5aFFLQWhvSXYxbVhVUTVtWVlqQS85M1c4elJEUldW?=
 =?utf-8?B?c0EwN0NxVi9EbGV5YXF3cWg4R0xWbjlRT3JMb3U5YkgwVllUL0UwWktLcjRp?=
 =?utf-8?B?Zi9BQ3M1eDJDeFo3SE9FRWVydHdqNEx4Y1pROFhTejcrVUpobStEWGQ1ZDM1?=
 =?utf-8?B?OUJDRlFJUXVUQ2ZkaVpxc2NDS1ZsNUVJMUNwSHJNNmh3ZTJIMmdjMUpiY2w5?=
 =?utf-8?B?SjdENjYzd2ZwNzJ2OSsrbURqWkdYVVBHaWVaRGNyUE5hUXBwclJEenZ4aDBk?=
 =?utf-8?B?ZHU4SlRvTEVjaGYvR2FuNnVhNno5YkZCQTNkSGdDa2xMdmNCRndjS3pSZ1Uy?=
 =?utf-8?B?SXg4S2c3a0J6a2M0and4cHQxRkovbGQ3dHV0RWxJaTBBWWd2dFBWQW9sZlM1?=
 =?utf-8?B?MXQ2WTBQRCs1bTFRSmRKdFZlVWp1VFA5aFpHejU3YmN5RU9pNFkxb0pHNTZv?=
 =?utf-8?B?MlRxa0RoWUxNamxXOTI5cTZocEJTZ3oxaUFmM2x0b2E0ME1uMjhhK0R6S1BC?=
 =?utf-8?B?Z1QyT3hHSFFGWG5pWlI4ZzFWT0RRN0swNmRMeWozT01kRkY5OHBNM3d0Zm55?=
 =?utf-8?Q?2PyqTBBQo8U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0ZIOXg2SDdjVzZzdlBTSEdDaHJQaCswcFY4aURodkNzSmdNN2hNQm9VUEU0?=
 =?utf-8?B?TDdFZC9Scng2NGlUY04vS0xqVlY1WGxRZ2FGUVR0a2oyZjJvQnN3MlgyU3cy?=
 =?utf-8?B?cm5RNU9ibE4wTENTUml1aTFHaE1mc1FhUjFOTDZZYjgyYTJramNXcUQvTGE5?=
 =?utf-8?B?SGgwN3Q5bnVYQ2FGaFhMWTk4bG5Ed290cFJkYUZsblFTdWdLTHJScXZlV21H?=
 =?utf-8?B?K2xZdVNyQjZrTkFXZnR0S2pOcDVpMkcyWXh0L2tOcG91L0tiWWdibTFuVjUx?=
 =?utf-8?B?RENuRnY4c016akQyTFM1OFdJeVZTd2RJN09wSWZNZEtCWFViTVpULzFtMTlW?=
 =?utf-8?B?TXUvTlVzT2x1U2hQcTdkaDR2SVJHWnVHanVmMThDSUo2U1FYajJ2K0x3MWlP?=
 =?utf-8?B?M3U3Lys1d1k3bXZxckhhTWYzWTdNcThjT0RBdkdnTHBnZjZ5MlZTc3FhMW1J?=
 =?utf-8?B?QXdZY1BLdHZsbGc2cThPNVdmd3EyUHRHM3gzQXpIVENEQndDNW1xbkNkYW94?=
 =?utf-8?B?ZW14Z1lTNTZTUElkaUtrWlFZcUpEUTZEZWY5WlY0NlVxdXphRE85b1RURGhx?=
 =?utf-8?B?RXZhM3BkalZ5UnFmVDRYM0hSNHN4NzhZTTU4b3FXeVYwT25KZmNOWGI1aGtS?=
 =?utf-8?B?YVR0S1VyNW5BemVKS0dMVDZRbFdxV3dOUXdzUXoyRHVCdXc1cnhwQ1FDeTZT?=
 =?utf-8?B?YzZlelRZRVNhVjBQVGcxZy82T2xLbi9kQmJKSGtGc2sybFI4UzRJckt6K3Iy?=
 =?utf-8?B?Z1hwalVDV09BUTVkU2FDL3dTUlRFb1dlUWZaajJCMkRubnZ5cDhDVVZFSWdH?=
 =?utf-8?B?RHZ6Y2xueDBUUnRKUFg2SWtpbnh1M1oxdDlzVzRrc3FqbXdNUWIrcGcyUWd2?=
 =?utf-8?B?NjZBaWxBM2NjWm5WWkRJdlIrczlJeW9BSVd6WEI5SGtEOVpJakFkV09EYjZM?=
 =?utf-8?B?WXgrY00rLzJlQjM2MGJFRkFvT0NmbFhHWFlmSzlaVHBVVE5vc1pTQm84QTBt?=
 =?utf-8?B?UXhNMlNIN3ZFdE5jNHRuSW8zWk1VaXlocGJlOTRVTmkycTN3UEV1S2E4K0w2?=
 =?utf-8?B?akozcGU0MWlOKzg3RVRCVEZQbGkzbGNESG9meEk5THgwaVJUR2RYMHRNVmRU?=
 =?utf-8?B?RUpXa2lLUlE4Um9xMmlpcHdZSzdHeDQ1Q3RzZ1lWbkxIUGpFbnhoZjJHM0ty?=
 =?utf-8?B?VjEyZ3NnWUJLVlNrRHRFZjdwVlVZMVNkM0UySmZVQ0dlQm85QUZVOHBneVlw?=
 =?utf-8?B?bU1GVjNWbU5QQzJYbzNBL3dXakVjWFlqMnNxVHhvOFZ2ZmdvUmVBbU5qMEhq?=
 =?utf-8?B?MW05QXdROTZ4ZXNMYUlVaVlBNVpDV0o0TGRYZ0JNdE1aNGtqenBKZlJpbUxP?=
 =?utf-8?B?aVFlTWFodHVwNnAzRlI2cjRxODUrVEw0YnJUYnp4eWtzNE82eHhEb3MzaWVX?=
 =?utf-8?B?eU4rNmV3N2VqM1JFUjM3NmUvbmJ3RFNLTXBnYThBTzRTSUc5SmFGSmlQRXNp?=
 =?utf-8?B?emVnLy9VZWErUkR6clVLZ0JvaVI2R1RaWWJ4dUM2NkJqNjBxS2Rrd05oUms3?=
 =?utf-8?B?Y1ZFQ3paMkdZNmJtQmRMZ1h2VlVGMThQR3V3WFp6Y2p4aTdvTklEbnErdnZx?=
 =?utf-8?B?ZUhlOUI0em12MCtQcFFzaTN2Y0QwdlJxOHEvZXhvNjB6Q0RTcytidzZYdDlD?=
 =?utf-8?B?Wm0vQVREQzhVTFhsczdhS2VqQm5aSFdoYmduV01zRHVsWENaOWlmcHhaaVp6?=
 =?utf-8?B?QlhkSEpOWkhjSlhacUlaWDVRQVpFVXJXdlBkSjdkY0lRcU96eHlRczJ2ZXdD?=
 =?utf-8?B?TTI5bitRVm44eWdVUXI2NU83QjF0NUN3R1QyME5wcWZ6RGNYNEN2WVZQN1FS?=
 =?utf-8?B?R0Jja1k3R2dKT3g5NFVxUmxZS2ZWTTVJMS9BZkdkaEZ2eG5kWlpiT3JHalI4?=
 =?utf-8?B?aDM5NDZ6K0pCaG5RakdzV3RkSGVzK1d4QWViQlJVYVUwVFA5bEFvd00zcml6?=
 =?utf-8?B?dU9tS0RJL1gzUE5valFkZVlOV1RndFFIOERRN1loY0o4WTRLV1JSRlB3N21X?=
 =?utf-8?B?aEhwck5SLzMrblJjSU1ZZmVnWWM2WCtsMmpJMG9FV0x6WWVZUWRwMFZNb1Zk?=
 =?utf-8?Q?ATWKSyOVTw2DOOM0/g/V/XgE5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae76c33d-d758-486c-38e0-08ddbae1d624
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:02:08.0642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxfcUDB5Gen5EXwKYXARutsWQp6CgUaA7NDgap2XqHXCUliC29/oiZ4AghA0DyLGZxIM6HVFHwa6cYJ878k37Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
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

Hi,

On 6/16/2025 1:12 PM, Peter Senna Tschudin wrote:
> Introduce core_debugfs_heads_power that is expected to work with any
> GPU, not limited to i915 and Xe. The test powers off all available
> heads before reading debugfs files, and then powers on all heads
> before reading the files again.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: michal.wajdeczko@intel.com
> Cc: marcin.bernatowicz@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: ewelina.musial@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> v3:
>   - renamed the test
>   - Removed reference to sysfs from comments  (thanks Kamil)
>   - Updated description to match the display part (thanks Kamil)
>   - Moved from "display" to "heads". Our CI uses "headless" to refer
>     to a DUT without display and it is shorter
>   - renamed subtests for shorter names (thanks Kamil)
>   - fixed comments style (thanks Kamil)
>   - updated CC list
>   - changed the order to test first with all heads off then with all heads on
>     to prevent the need from powering on the heads at the end of the test
>     (thanks Kamil)
>   - removed snprintf from test names (thanks Kamil)
>   - removed subtest group (thanks Kamil)
>   - deleted kms_tests() and moved the code to igt_main (thanks Kamil)
>
> v2:
>   - changed style of comparison to NULL
>   - moved to a separate patch
>
>   tests/core_debugfs_heads_power.c | 156 +++++++++++++++++++++++++++++++
>   tests/meson.build                |   1 +
>   2 files changed, 157 insertions(+)
>   create mode 100644 tests/core_debugfs_heads_power.c
>
> diff --git a/tests/core_debugfs_heads_power.c b/tests/core_debugfs_heads_power.c
> new file mode 100644
> index 000000000..1813986d8
> --- /dev/null
> +++ b/tests/core_debugfs_heads_power.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_debugfs.h"
> +#include "igt_dir.h"
> +
> +/**
> + * TEST: debugfs heads power test
> + * Description: Read entries from debugfs with all heads on and with all heads
> + *		off.
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: debugfs
> + * Feature: core
> + * Test category: uapi
> + *
> + * SUBTEST: off-read-all
> + * Description: Read all debugfs entries with heads off.
> + *
> + * SUBTEST: on-read-all
> + * Description: Read all debugfs entries with heads on.
> + */
> +
> +/**
> + * bool igt_kms_all_displays_on: Try to turn on all heads
> + * @display: pointer to the igt_display structure
> + *
> + * Returns: void
> + */
> +static void igt_display_all_on(igt_display_t *display)
> +{
> +	struct igt_fb fb[IGT_MAX_PIPES];
> +	enum pipe pipe;
> +	int ret;
> +
> +	/* try to light all pipes */
> +retry:
> +	for_each_pipe(display, pipe) {
> +		igt_output_t *output;
> +
> +		for_each_valid_output_on_pipe(display, pipe, output) {
> +			igt_plane_t *primary;
> +			drmModeModeInfo *mode;
> +
> +			if (output->pending_pipe != PIPE_NONE)
> +				continue;
> +
> +			igt_output_set_pipe(output, pipe);
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			mode = igt_output_get_mode(output);
> +			igt_create_pattern_fb(display->drm_fd,
> +						mode->hdisplay, mode->vdisplay,
> +						DRM_FORMAT_XRGB8888,
> +						DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
> +
> +			/* Set a valid fb as some debugfs like to
> +			 * inspect it on a active pipe
> +			 */
> +			igt_plane_set_fb(primary, &fb[pipe]);
> +			break;
> +		}
> +	}
> +
> +	if (display->is_atomic)
> +		ret = igt_display_try_commit_atomic(display,
> +				DRM_MODE_ATOMIC_TEST_ONLY |
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);
> +	else
> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
> +
> +	if (ret) {
> +		igt_output_t *output;
> +		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
> +
> +		igt_require_f(found, "No valid mode combo found.\n");
> +
> +		for_each_connected_output(display, output)
> +			igt_output_set_pipe(output, PIPE_NONE);
> +
> +		goto retry;
> +	}
Instead of this could we use the wrapper function, 'igt_fit_modes_in_bw'?
> +
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +
> +/**
> + * bool igt_kms_all_displays_off: Try to turn off all heads
> + * @display: pointer to the igt_display structure
> + *
> + * Returns: void
> + */
> +static void igt_display_all_off(igt_display_t *display)
> +{
> +	enum pipe pipe;
> +	igt_output_t *output;
> +	igt_plane_t *plane;
> +
> +	for_each_connected_output(display, output)
> +		igt_output_set_pipe(output, PIPE_NONE);
> +
> +	for_each_pipe(display, pipe)
> +		for_each_plane_on_pipe(display, pipe, plane)
> +			igt_plane_set_fb(plane, NULL);
> +
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +
> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
> +
> +igt_main
> +{
> +	int debugfs = -1;
> +	igt_display_t *display;
> +	int fd = -1;
> +	igt_dir_t *igt_dir = NULL;
> +
> +	igt_fixture {
> +		fd = drm_open_driver_master(DRIVER_ANY);
> +		debugfs = igt_debugfs_dir(fd);
> +		igt_require(debugfs >= 0);
> +
> +		igt_dir = igt_dir_create(debugfs);
> +		igt_require(igt_dir);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		display = calloc(1, sizeof(*display));
> +		igt_display_require(display, fd);

Could we also add 'igt_display_require_output' to assure we've at least 
one output connected?

Regards,
Karthik.B.S
> +	}
> +
> +	igt_subtest("off-read-all") {
> +		igt_display_all_off(display);
> +
> +		igt_dir_scan_dirfd(igt_dir, -1);
> +		igt_dir_process_files(igt_dir, NULL, NULL);
> +	}
> +
> +	igt_subtest("on-read-all") {
> +		/* try to light all pipes */
> +		igt_display_all_on(display);
> +
> +		igt_dir_scan_dirfd(igt_dir, -1);
> +		igt_dir_process_files(igt_dir, NULL, NULL);
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(display);
> +		close(debugfs);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index fa62cbeb9..99dbd4feb 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -1,6 +1,7 @@
>   test_progs = [
>   	'core_auth',
>   	'core_debugfs',
> +	'core_debugfs_heads_power',
>   	'core_getclient',
>   	'core_getstats',
>   	'core_getversion',
