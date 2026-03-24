Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE216FEC0F7
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 19:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A36210E182;
	Tue, 24 Mar 2026 19:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lh58tS+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2197510E182
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 19:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774380352; x=1805916352;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=h+mblEOgti3RSdX0g/CVgrQV0Og0U4tEk5GH3RV+B3s=;
 b=lh58tS+RGNOdH4bV+PdtX2CDiBdBEmVVtDg3mz+02IbZ36iisWQKlBm0
 0iINLWV6mD2OLE5y3x0NQo7wB1Dfql4cCNmcvx3shaL27+OwYGfJzv7/k
 E762FhhXlaBHBFMlG2gEMkWlqyKCBEI9o1+kWVRNA4AeQLdPHpUsssDQ/
 VRT6Jkp+iKJ8aGSV0RBTTHU5VEW5dlE8fWYt6Vp3nNcCMmvXk+8CctGMO
 GNGnXAXsUQXK4792TvEjUfiruHlYbQJrxImspWl5meSPttVAu2ahkhvkM
 BYXVu41d1YOMZueHFjmKdNgQ1Xpdr3etxhyGngE5A5ZumsLH12T/MWfu9 g==;
X-CSE-ConnectionGUID: RjN6gCjlSOytUCn6znSv9w==
X-CSE-MsgGUID: MLp8V0XQSOC1uaaEcmy03A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="92793122"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208,217";a="92793122"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 12:25:51 -0700
X-CSE-ConnectionGUID: 2pcVCotITQiPwW4LyIEBIw==
X-CSE-MsgGUID: Mzm9abdLTW6ZoQuEpzbcTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
 d="scan'208,217";a="262381523"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 12:25:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 12:25:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 12:25:49 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 12:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBgMDdOn/Ta4FG7JkUkEovxzoDIT2rTif25H5E85tpDqdq0yMhNnEW3GaK6LyPSamUlEoE6eIO6HngrkPzRP2AAM8FD41iaBtjH4njvXUOJlrtWWXME67TJ8zeppJNpUgv8dSuhlbyRVdcO1Ki4JJW/QxVErN+FlrLTRYEc+OET4tZCPvpFfo2mR34zvMmBIJ3Kef2qhWhRxGpXpP7UKqwOMdq4WK/SJzwob4rlWpGZ1JykxJS7gY2xE4deZFQUAF2wcCDeH4mSpkLiVeoKJy4qTIhHrrfecVKejlRZTEA5zYDQSir478SsAjjJoEY3XbVjO/sFodb+YWvmS76Cbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFx1ZemBvCyvgfD9FXZrvG4OxhInWn8y9HHpdQQGcFc=;
 b=FvhmHC8HHPIt8MwCHf/v647iD5x7Vz4v7BTblaI9hS9EuVZitZzBatyzXH7dhSvSowVhpjDp5k4jTRFP01ptbE08kABGk1jY7abk1gEMzI6Hz0YlawEkGoQddOVogcJbiCaMFzEJkZGZa8mvgj6qOFwp7dw9d3wCQRzKNxs5uiSJuJb4vGu+xNwXbfJ4RJB1H65fwmSuCgLRyqIO4XKiByxnvt0nHV+VfTNpGaOGdCQqcchWoUGpNK46YJYmaQ2KaI0TCYsf0QWNljREuCUMDlnWip2HB31dsQiY0VMBxZkXS4SRLF+J3f44ldngL9moJrwYYKGMI7RTt7sO/X0klg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by SA0PR11MB4653.namprd11.prod.outlook.com (2603:10b6:806:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 19:25:46 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9745.012; Tue, 24 Mar 2026
 19:25:46 +0000
Content-Type: multipart/alternative;
 boundary="------------jAzkDPgZnkF5dZbmwcM95Sam"
Message-ID: <9a265197-b657-4e5b-a9e6-049d66fc6f74@intel.com>
Date: Wed, 25 Mar 2026 00:55:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 31/49] tests/unigraf: Add basic unigraf tests
To: <igt-dev@lists.freedesktop.org>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-31-a01dffc3b0cb@bootlin.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260316-unigraf-integration-v9-31-a01dffc3b0cb@bootlin.com>
X-ClientProxiedBy: MA5PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::14) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|SA0PR11MB4653:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf5e7d4-721b-43c9-900f-08de89db25f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: /pBcDnzvPgU6RX2/BbiuJlMrtkrUgDMtYKDl/JxaeSQqYOTVqb2h/NcwTHbrf9+xV7olqUGVuPqVP0b+ZlfZaO9IAYTU3kHO/0dOTWuG5TP8Zcz5ScJlMi1L1ECJAT2/U01cnTEHjQierJY+k3bYlfcSIcy8LAjsO4s50xEeMHv0ZQu8jo0ZyDrhL++5NYP4Q3u+q0z6OzH++eQsRB52nOpJuAt2kC5iybE6dX8ZY6yzqrDzfiPBrNSIGJWFUJ801b2sutK8RNMjNYu5Vt0hG6IY/WaLqZiugd4pgLsO863iybGoW0pBQJOmkAVlrj/Sq1q3DX4pX5SGXfiXYCM3C+UDxlploHJfgAqhqWNAiHbiHzTuAtx6nsH0YUxvcGzrpJGyahFLiVINYx1VbzA1jF8bDu1KQyI8ZL42FOmivBnmS6VtPvCUvafaKSDSPPxHNeim+bv4FS4DbGwhOg9sUbsL7aIPm4trzXa+7AMQmGsB3lvAGO16FGOHqQt7lZ7mSdo6aW5+N5plZ53TMSZeeODDcefI9sKOhfPZDQSfVG4CCHtx5a3mVCe+gbwdvcFWPILKnXjFW6cdah1weAjSeHn/PezNmdX2XCvIS/VfPtjSrhEAL01OTTUvILf7i6S5VZXkIf+CE/EK0W60Ussw2uR6nWHlaOSZoNH7DoXCtlYChTkUQBdxbkA3rSu39+6rfRM6tEvWyYRYOXFGVSVNBr6YSvRHUJ9PRD4gzny8mC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEtDQklEVytLaDFaQndqcHVSUFhpVldmWU4wSjFITUhTZHhVU1hDWGZ6M2xM?=
 =?utf-8?B?TlBTWUxINWVkZ3p4RnQzRHZZVFVwQStNYXVnRnpvUmIzQ3psUWE4S1M1bytG?=
 =?utf-8?B?U0ZmL2RlNzdPVElQalV6eW5TRXpMSFo3UTB1TGoydDIxMXFEL1lRNVl5M2wy?=
 =?utf-8?B?djR0RXhvc3VYU3hRYVVsRXlGTnoySW9uZ2xSSTNNdXVoMlpkMWd1RllROVQz?=
 =?utf-8?B?eGFWZFprajh1VVZSM2U0bDZNbGxaaDIyODZReTE3eHR2OGdHS0dUSkh2SUFY?=
 =?utf-8?B?VTI0RWoyeXVVTHBKU0JBM3JrTGNVYXBkY1VYNmQyWmlDT1kwMGpUTEJpK0ZM?=
 =?utf-8?B?L3FTb2N2cURXNWp6dW0vUjRwczVuc1RIbHBqOHoyZnNXZGtXSEhseVFsaVZp?=
 =?utf-8?B?U2lUNnEweHVHcW1pVFgrNE9BMlYzMDVpdXZKNGlldGRWY292ZzJmbjJ2Qzcw?=
 =?utf-8?B?SzBlYzdZNW8wbTBialF5TDZlV3A0SzN4STV2YTlUVDF1Ty92eDlFUFJjd1VV?=
 =?utf-8?B?c1lObUNJTG85YTVhNkFsRFdTUTE0cVRiWmRnaXRTQ1pmVTZXZ2RqcUhzbVBI?=
 =?utf-8?B?N0hpNENIUzNVWWJMY2NTV3FFMXhzVkxpbFkyVFpqMDdQQTNBTmtwWDI4R2cw?=
 =?utf-8?B?UlN1NUQ1T2ZsRnJSbVd1Nzg3clZmQSt1R2FYMmkxTWVjeXlrdXUrTHdIQ3BO?=
 =?utf-8?B?cTF1ZjgrNWcrMEUzV0FsNzNUZTNRU0dMVmpPNHNBUzhxQmovb0VqU3lreXFC?=
 =?utf-8?B?NWRpWWdERlgyelI5Y2h3cG11LzZVTVpGZ1pnakJIck95cXQvZkFqYTRqbHVI?=
 =?utf-8?B?cjh0Ly85WXRVa0NpcXk3a1BXdG9ENDlhV2dLMFJhTnVFVkRPdHliSFNZMGFZ?=
 =?utf-8?B?aUxMejVHc1ZKM2dWZ09JM3RjQ0FpM1FUMTVYdWVvaGNLd09xelZwbks1cTBp?=
 =?utf-8?B?QTdBai9Nb2cvckROTHhEQ0diN1VaVngzd3FhNUVJYWRwSXI1dlVIa2tqUjl4?=
 =?utf-8?B?T2JhN3FDWTJqYzJjV3dEeUZsRzZOL3gyMURRU3VQWFROdU5pUGNTTzF6ZHE5?=
 =?utf-8?B?NVAxSEVUYld0bFhsK0E3a21zektiUE1pMEU3SjRNd3EvK3hLQW42aFdFWWZl?=
 =?utf-8?B?QllqUUNEM1lCaHMreG9adHdzZnZKamkwV2NidWRWOUFoYy9lYnh5R0xCaktM?=
 =?utf-8?B?eitpN0wzcWJEdHdKQ214aXE2U2txcndVbDVxZVdUTG5maFNqRS9ZWnBOOExo?=
 =?utf-8?B?STR5M284M0FuTW9GRFBFTHV5SlZOMGc0eWJLOGpLVkp1N0pWU09TRlhpYnVh?=
 =?utf-8?B?YzZ5UXZsdWlKbUxhUWxEZGFjbGs3WFVlN053cURJNzNseGc2ODd3cEN0Rklz?=
 =?utf-8?B?c0MzYVdFNzhncUJzWFBybjFjb2txSHhpUENTWEtwR3lyZGZ0VngwZWRDcjZi?=
 =?utf-8?B?LzBObFpDbDMxeUovU2pYeWJNTUVhY3IwSnRCL2twOU1DRWxVZm9BazRzbXZL?=
 =?utf-8?B?RVFVOFNELzR1b1loL2FKbmZaOFprUXM0NG8zZnE4d3B3eUhRTXZwZWxic1dG?=
 =?utf-8?B?ZDh2YmUyOFdOeG1wK3FzZzJuRW9KWFp3MTNwRWplTHhNckMxYS9wdjE1TTRj?=
 =?utf-8?B?aXBuNUwzcjFqQVR5TUdmSWI5MzdyMERndDczOXprWjE3WlRoRGpCWERQSFVX?=
 =?utf-8?B?aEFNRE0zU3ozMkRQWisxU2R5OXhaaDNkOTA5Q3d3NkdkckhRdzN2NDRKc1Y5?=
 =?utf-8?B?azhzME5YRW84K1c5WWEvTkYrWWhqS2JFTWNQSGRlMWtHYzhpbGZXclVRbHpP?=
 =?utf-8?B?c2xiOS96ZHFDMUx2LzNteHVMMGEram9pOHhrZTR4U1Q2bXJZUjdtTURHbVpz?=
 =?utf-8?B?d0hZK0NoMGszbTQrN1RRdjVORFlGcCtuZEJTNkpFc1Z2S1dmOFYycXJkZmRj?=
 =?utf-8?B?dHBlU3JyMVhvMmtHZFF2ZENxcnRMTnpIckloOTZ4ckphK0lwdllHT0YrRWZo?=
 =?utf-8?B?QURxZkFKcU8vQnpjY0o0ODRNMUVwUG5MUGpzTUVuL3I2MnpXcEo0bXpnbmNF?=
 =?utf-8?B?eHhwb3FlOHhNNFMvNk15OGszYkF2VzZ6RkpObVZreksvMk1NRjBxL0pNcWc2?=
 =?utf-8?B?RzNpY1FyUG9qb3lqMkdQZHRBK09BcFVYMStTUHYwRUhmNzNyR0x1SkdXVE1o?=
 =?utf-8?B?eVVyb0FlMi9rREM0SHB0U3JPempLUVVBb0ttZTNiOUdIK1ZUcTU3d09oUmsy?=
 =?utf-8?B?enBUbGx5RWZ6emlac3V0VllydThxaEJHbjM2WU1aRWVsVFlQTnBGMnNTaEFh?=
 =?utf-8?B?c083ZS9CY3NFUWdzZmhNRW0rS1Q3QWwyeUJHTm9HMjhvckVMUkVYTG54ZU5X?=
 =?utf-8?Q?0zZ82dapNCrFMjjU=3D?=
X-Exchange-RoutingPolicyChecked: Y1u22XBUF02lsq4Ieank9HuCRYW7RkIKQntiRHPD5Cd/lLJhKtm0497jM7g/v6JCStcBP/OProAhGRjFXimY3ljYDli27GQEjJOddZPmxk7WmI4E5wxyEnezFqJhceTC5lXg+DsU/B4VPuLl9ogo3aljMIX6K61QO95jbHoDhgJEoXGOoY6dkZn9zBMZmkbKwuM4PxNsVmG4Y4WKwN7pWWuSGqBdx1DHxyZz99Deplqwnqt2kDRxz9orVkyjNDeILWB4KuShgIq5QW+V0ubDSqjDpldAxHB4/fkTvlYdXS1AvVdJCGIJjOv00cvJgzqzlY76/zFV3dzJ+izoQ0sH1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf5e7d4-721b-43c9-900f-08de89db25f0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 19:25:46.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0Xad/+DNi5dCIl9K2esPdZi8sJc4HWT/xIIn3xNFB01k+q0l8uhxu7vVs0Se9go5RcPlYZULKSZ8p3gy9Yo5KFiy8xKeP0X/ECDrqsTirY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
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

--------------jAzkDPgZnkF5dZbmwcM95Sam
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Louis,

On 3/16/2026 9:47 PM, Louis Chauvet wrote:
> Adds two tests to validate unigraf communication.
>
> unigraf-connect checks if the device is connected and if the EDID is
> properly applied.
>
> ungiraf-reconnect checks if the device can be connected/reconnected
> using SST and MST configurations.
>
> Signed-off-by: Louis Chauvet<louis.chauvet@bootlin.com>
> ---
>   tests/meson.build                    |   4 +
>   tests/unigraf/meson.build            |  12 +++
>   tests/unigraf/unigraf_connectivity.c | 138 +++++++++++++++++++++++++++++++++++
>   3 files changed, 154 insertions(+)
>
> diff --git a/tests/meson.build b/tests/meson.build
> index cecb4a8ae34a..4d3399d0eff4 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -475,6 +475,10 @@ foreach prog : intel_progs
>   	endif
>   endforeach
>   
> +if libtsi.found()
> +	subdir('unigraf')
> +endif
> +
>   if chamelium.found()
>   	foreach prog : chamelium_progs
>   		testexe = executable(prog,
> diff --git a/tests/unigraf/meson.build b/tests/unigraf/meson.build
> new file mode 100644
> index 000000000000..4ef8c32151e4
> --- /dev/null
> +++ b/tests/unigraf/meson.build
> @@ -0,0 +1,12 @@
> +unigraf_progs = [
> +	'unigraf_connectivity',
> +]
> +
> +foreach prog : unigraf_progs
> +	test_executables += executable(prog, prog + '.c',
> +				       dependencies : test_deps,
> +				       install_dir : unigrafdir,
> +				       install_rpath : unigraf_rpathdir,
> +				       install : true)
> +	test_list += join_paths('unigraf', prog)
> +endforeach
> diff --git a/tests/unigraf/unigraf_connectivity.c b/tests/unigraf/unigraf_connectivity.c
> new file mode 100644
> index 000000000000..b35149a4de9a
> --- /dev/null
> +++ b/tests/unigraf/unigraf_connectivity.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Google
> + *
> + * Authors:
> + *   Louis Chauvet<louis.chauvet@bootlin.com>
> + */
> +
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <xf86drmMode.h>
> +
> +#include "drmtest.h"
> +#include "igt_aux.h"
> +#include "igt_core.h"
> +#include "igt_kms.h"
> +#include "unigraf/unigraf.h"
> +
> +/**
> + * TEST: unigraf connectivity
> + * Category: Core
> + * Description: Testing connectivity with a unigraf device
> + *
> + * SUBTEST: unigraf-connect-edid
> + * Description: Verify that the unigraf device is properly connected to the DUT
> + *              and that the correct EDID is detected and read.
> + *
> + * SUBTEST: unigraf-connect-mst
> + * Description: Ensure that the DUT can correctly detect and handle the unigraf device
> + *              when it is configured to operate in MST mode.
> + */
> +
> +IGT_TEST_DESCRIPTION("Test basic unigraf connectivity");
> +int igt_main()
> +{
> +	int drm_fd;
> +
> +	igt_fixture() {
> +		drm_fd = drm_open_driver_master(DRIVER_ANY);
> +	}
> +
> +	igt_describe("Make sure that the unigraf device is connected to the DUT and EDID is properly detected");
> +	igt_subtest("unigraf-connect-edid") {
> +		drmModePropertyBlobPtr edid_blob = NULL;
> +		struct igt_display display;
> +		uint64_t edid_blob_id;
> +		igt_output_t *output;
> +		uint32_t unigraf_edid_len;
> +		void *unigraf_edid;
> +		bool found = false;
> +
> +		/*
> +		 * Sleep are required to allow hardware to configure/detect the current
> +		 * configuration
> +		 */
> +		unigraf_require_device(drm_fd);

I think delays side need to check again. If i ran subtest alone observed 
new connector timeouts.

Starting subtest: unigraf-connect-mst
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:(nil): Initialize 
unigraf...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:(nil): No 
connector name configured, will autodetect.
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:(nil): MST usage 
not configured, using SST.
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:(nil): Detected 
unigraf device 0: UCD-500 [2607C673]
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Successfully opened the unigraf device 0.
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Role 0: DisplayPort Source and Sink
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Role 1: DisplayPort Source and USB-C, DP Alt Mode Sink
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Role 2: DisplayPort Sink and USB-C, DP Alt Mode Source
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Role 3: USB-C, DP Alt Mode Source and Sink
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Input 0: USB-C RX
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_FORCE_HOT_PLUG_STATE_W=0...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_DPRX_LINK_FLAGS=86...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_FORCE_HOT_PLUG_STATE_W=1...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_DPRX_LINK_FLAGS=86...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_FORCE_HOT_PLUG_STATE_W=0...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_FORCE_HOT_PLUG_STATE_W=1...
*(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
No newly connected connector, assuming that the unigraf is not connected.*
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_DPRX_HPD_FORCE=12...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_DPRX_MST_SINK_COUNT=1...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value read: TSI_DPRX_MST_SINK_COUNT=1
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_DPRX_LINK_FLAGS=86...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Write EDID for stream 3...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_EDID_SELECT_STREAM=3...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Writing 2048 bytes to 0x1100
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Write EDID for stream 2...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_EDID_SELECT_STREAM=2...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Writing 2048 bytes to 0x1100
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Write EDID for stream 1...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_EDID_SELECT_STREAM=1...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Writing 2048 bytes to 0x1100
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Write EDID for stream 0...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_EDID_SELECT_STREAM=0...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Writing 2048 bytes to 0x1100
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_FORCE_HOT_PLUG_STATE_W=1...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_DPRX_MAX_LANES=4...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_DPRX_MAX_LINK_RATE=30...
(unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:0x630f991906c0: 
Value write: TSI_DPRX_LINK_FLAGS=86...
Test requirement not met in function unigraf_require_device, file 
../lib/unigraf/unigraf.c:534:
Test requirement: unigraf_open_device(drm_fd)

> +		unigraf_hpd_deassert();
> +		sleep(igt_default_display_detect_timeout());
> +		unigraf_set_sst();
> +		unigraf_hpd_assert();
> +		sleep(igt_default_display_detect_timeout());
> +		igt_display_require(&display, drm_fd);
> +		sleep(igt_default_display_detect_timeout());
> +
> +		unigraf_edid = unigraf_read_edid(0, &unigraf_edid_len);
> +
> +		for_each_connected_output(&display, output) {
> +			if (output->config.connector->connector_type ==
> +			    DRM_MODE_CONNECTOR_DisplayPort) {
> +				igt_assert(kmstest_get_property(drm_fd,
> +								output->config.connector->connector_id,
> +								DRM_MODE_OBJECT_CONNECTOR, "EDID",
> +								NULL, &edid_blob_id, NULL));
> +				edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
> +				if (!edid_blob)
> +					continue;
> +
> +				if (!memcmp(unigraf_edid, edid_blob->data,
> +					    min(edid_blob->length, unigraf_edid_len)))
> +					found = true;
> +
> +				drmModeFreePropertyBlob(edid_blob);
> +
> +				if (found)
> +					break;
> +			}
> +		}
> +		igt_assert_f(found, "No output with the correct EDID was found\n");
> +
> +		free(unigraf_edid);
> +	}
> +
> +	igt_describe("Make sure that the unigraf device can be used as a MST device");
> +	igt_subtest("unigraf-connect-mst") {
> +		int newly_connected_count, already_connected_count, diff_len;
> +		uint32_t *newly_connected = NULL, *already_connected = NULL, *diff = NULL;
> +		int max_count;
> +
> +		unigraf_require_device(drm_fd);
> +		max_count = unigraf_get_mst_stream_max_count();
> +
> +		unigraf_hpd_deassert();
> +
> +		already_connected_count = igt_get_connected_connectors(drm_fd, &already_connected);
> +
> +		igt_debug("Already connected count: %d\n", already_connected_count);
> +
> +		// i = 0 is SST so we need to process max_count + 1 streams
> +		for (int i = 0; i <= max_count; i++) {
> +			unigraf_hpd_deassert();
> +			// Let the hardware detect the new state
> +			sleep(igt_default_display_detect_timeout());
> +
> +			unigraf_set_mst_stream_count(max(i, 1));
> +			if (!i)
> +				unigraf_set_sst();
> +			else
> +				unigraf_set_mst();
> +
> +			unigraf_hpd_assert();
> +			// Let the hardware detect the new state
> +			sleep(igt_default_display_detect_timeout());
> +
> +			newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
> +									    already_connected,
> +									    already_connected_count,
> +									    drm_fd);
> +
> +			diff_len = get_array_diff(newly_connected, newly_connected_count,
> +						  already_connected, already_connected_count, &diff);
> +
> +			igt_assert_f(diff_len == max(i, 1),
> +				     "Invalid connected connector count, expected %d found %d\n",
> +				     max(i, 1), diff_len);
> +		}
> +	}
> +}
>
--------------jAzkDPgZnkF5dZbmwcM95Sam
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Louis,</p>
    <div class="moz-cite-prefix">On 3/16/2026 9:47 PM, Louis Chauvet
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260316-unigraf-integration-v9-31-a01dffc3b0cb@bootlin.com">
      <pre wrap="" class="moz-quote-pre">Adds two tests to validate unigraf communication.

unigraf-connect checks if the device is connected and if the EDID is
properly applied.

ungiraf-reconnect checks if the device can be connected/reconnected
using SST and MST configurations.

Signed-off-by: Louis Chauvet <a class="moz-txt-link-rfc2396E" href="mailto:louis.chauvet@bootlin.com">&lt;louis.chauvet@bootlin.com&gt;</a>
---
 tests/meson.build                    |   4 +
 tests/unigraf/meson.build            |  12 +++
 tests/unigraf/unigraf_connectivity.c | 138 +++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)

diff --git a/tests/meson.build b/tests/meson.build
index cecb4a8ae34a..4d3399d0eff4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -475,6 +475,10 @@ foreach prog : intel_progs
 	endif
 endforeach
 
+if libtsi.found()
+	subdir('unigraf')
+endif
+
 if chamelium.found()
 	foreach prog : chamelium_progs
 		testexe = executable(prog,
diff --git a/tests/unigraf/meson.build b/tests/unigraf/meson.build
new file mode 100644
index 000000000000..4ef8c32151e4
--- /dev/null
+++ b/tests/unigraf/meson.build
@@ -0,0 +1,12 @@
+unigraf_progs = [
+	'unigraf_connectivity',
+]
+
+foreach prog : unigraf_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : test_deps,
+				       install_dir : unigrafdir,
+				       install_rpath : unigraf_rpathdir,
+				       install : true)
+	test_list += join_paths('unigraf', prog)
+endforeach
diff --git a/tests/unigraf/unigraf_connectivity.c b/tests/unigraf/unigraf_connectivity.c
new file mode 100644
index 000000000000..b35149a4de9a
--- /dev/null
+++ b/tests/unigraf/unigraf_connectivity.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Louis Chauvet <a class="moz-txt-link-rfc2396E" href="mailto:louis.chauvet@bootlin.com">&lt;louis.chauvet@bootlin.com&gt;</a>
+ */
+
+#include &lt;stdint.h&gt;
+#include &lt;stdlib.h&gt;
+#include &lt;unistd.h&gt;
+#include &lt;xf86drmMode.h&gt;
+
+#include &quot;drmtest.h&quot;
+#include &quot;igt_aux.h&quot;
+#include &quot;igt_core.h&quot;
+#include &quot;igt_kms.h&quot;
+#include &quot;unigraf/unigraf.h&quot;
+
+/**
+ * TEST: unigraf connectivity
+ * Category: Core
+ * Description: Testing connectivity with a unigraf device
+ *
+ * SUBTEST: unigraf-connect-edid
+ * Description: Verify that the unigraf device is properly connected to the DUT
+ *              and that the correct EDID is detected and read.
+ *
+ * SUBTEST: unigraf-connect-mst
+ * Description: Ensure that the DUT can correctly detect and handle the unigraf device
+ *              when it is configured to operate in MST mode.
+ */
+
+IGT_TEST_DESCRIPTION(&quot;Test basic unigraf connectivity&quot;);
+int igt_main()
+{
+	int drm_fd;
+
+	igt_fixture() {
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
+	}
+
+	igt_describe(&quot;Make sure that the unigraf device is connected to the DUT and EDID is properly detected&quot;);
+	igt_subtest(&quot;unigraf-connect-edid&quot;) {
+		drmModePropertyBlobPtr edid_blob = NULL;
+		struct igt_display display;
+		uint64_t edid_blob_id;
+		igt_output_t *output;
+		uint32_t unigraf_edid_len;
+		void *unigraf_edid;
+		bool found = false;
+
+		/*
+		 * Sleep are required to allow hardware to configure/detect the current
+		 * configuration
+		 */
+		unigraf_require_device(drm_fd);</pre>
    </blockquote>
    <p>I think delays side need to check again. If i ran subtest alone
      observed new connector timeouts.</p>
    <p>Starting subtest: unigraf-connect-mst<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:(nil):
      Initialize unigraf...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:(nil): No
      connector name configured, will autodetect.<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:(nil): MST
      usage not configured, using SST.<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG: TSI:(nil):
      Detected unigraf device 0: UCD-500 [2607C673]<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Successfully opened the unigraf device 0.<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Role 0: DisplayPort Source and Sink<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Role 1: DisplayPort Source and USB-C, DP Alt
      Mode Sink<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Role 2: DisplayPort Sink and USB-C, DP Alt
      Mode Source<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Role 3: USB-C, DP Alt Mode Source and Sink<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Input 0: USB-C RX<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_FORCE_HOT_PLUG_STATE_W=0...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_DPRX_LINK_FLAGS=86...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_FORCE_HOT_PLUG_STATE_W=1...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_DPRX_LINK_FLAGS=86...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_FORCE_HOT_PLUG_STATE_W=0...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_FORCE_HOT_PLUG_STATE_W=1...<br>
      <b>(unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
        TSI:0x630f991906c0: No newly connected connector, assuming that
        the unigraf is not connected.</b><br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_DPRX_HPD_FORCE=12...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_DPRX_MST_SINK_COUNT=1...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value read: TSI_DPRX_MST_SINK_COUNT=1<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_DPRX_LINK_FLAGS=86...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Write EDID for stream 3...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_EDID_SELECT_STREAM=3...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Writing 2048 bytes to 0x1100<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Write EDID for stream 2...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_EDID_SELECT_STREAM=2...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Writing 2048 bytes to 0x1100<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Write EDID for stream 1...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_EDID_SELECT_STREAM=1...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Writing 2048 bytes to 0x1100<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Write EDID for stream 0...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_EDID_SELECT_STREAM=0...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Writing 2048 bytes to 0x1100<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_FORCE_HOT_PLUG_STATE_W=1...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_DPRX_MAX_LANES=4...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_DPRX_MAX_LINK_RATE=30...<br>
      (unigraf_connectivity:7675) unigraf/unigraf-DEBUG:
      TSI:0x630f991906c0: Value write: TSI_DPRX_LINK_FLAGS=86...<br>
      Test requirement not met in function unigraf_require_device, file
      ../lib/unigraf/unigraf.c:534:<br>
      Test requirement: unigraf_open_device(drm_fd)</p>
    <blockquote type="cite" cite="mid:20260316-unigraf-integration-v9-31-a01dffc3b0cb@bootlin.com">
      <pre wrap="" class="moz-quote-pre">
+		unigraf_hpd_deassert();
+		sleep(igt_default_display_detect_timeout());
+		unigraf_set_sst();
+		unigraf_hpd_assert();
+		sleep(igt_default_display_detect_timeout());
+		igt_display_require(&amp;display, drm_fd);
+		sleep(igt_default_display_detect_timeout());
+
+		unigraf_edid = unigraf_read_edid(0, &amp;unigraf_edid_len);
+
+		for_each_connected_output(&amp;display, output) {
+			if (output-&gt;config.connector-&gt;connector_type ==
+			    DRM_MODE_CONNECTOR_DisplayPort) {
+				igt_assert(kmstest_get_property(drm_fd,
+								output-&gt;config.connector-&gt;connector_id,
+								DRM_MODE_OBJECT_CONNECTOR, &quot;EDID&quot;,
+								NULL, &amp;edid_blob_id, NULL));
+				edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
+				if (!edid_blob)
+					continue;
+
+				if (!memcmp(unigraf_edid, edid_blob-&gt;data,
+					    min(edid_blob-&gt;length, unigraf_edid_len)))
+					found = true;
+
+				drmModeFreePropertyBlob(edid_blob);
+
+				if (found)
+					break;
+			}
+		}
+		igt_assert_f(found, &quot;No output with the correct EDID was found\n&quot;);
+
+		free(unigraf_edid);
+	}
+
+	igt_describe(&quot;Make sure that the unigraf device can be used as a MST device&quot;);
+	igt_subtest(&quot;unigraf-connect-mst&quot;) {
+		int newly_connected_count, already_connected_count, diff_len;
+		uint32_t *newly_connected = NULL, *already_connected = NULL, *diff = NULL;
+		int max_count;
+
+		unigraf_require_device(drm_fd);
+		max_count = unigraf_get_mst_stream_max_count();
+
+		unigraf_hpd_deassert();
+
+		already_connected_count = igt_get_connected_connectors(drm_fd, &amp;already_connected);
+
+		igt_debug(&quot;Already connected count: %d\n&quot;, already_connected_count);
+
+		// i = 0 is SST so we need to process max_count + 1 streams
+		for (int i = 0; i &lt;= max_count; i++) {
+			unigraf_hpd_deassert();
+			// Let the hardware detect the new state
+			sleep(igt_default_display_detect_timeout());
+
+			unigraf_set_mst_stream_count(max(i, 1));
+			if (!i)
+				unigraf_set_sst();
+			else
+				unigraf_set_mst();
+
+			unigraf_hpd_assert();
+			// Let the hardware detect the new state
+			sleep(igt_default_display_detect_timeout());
+
+			newly_connected_count = kms_wait_for_new_connectors(&amp;newly_connected,
+									    already_connected,
+									    already_connected_count,
+									    drm_fd);
+
+			diff_len = get_array_diff(newly_connected, newly_connected_count,
+						  already_connected, already_connected_count, &amp;diff);
+
+			igt_assert_f(diff_len == max(i, 1),
+				     &quot;Invalid connected connector count, expected %d found %d\n&quot;,
+				     max(i, 1), diff_len);
+		}
+	}
+}

</pre>
    </blockquote>
  </body>
</html>

--------------jAzkDPgZnkF5dZbmwcM95Sam--
