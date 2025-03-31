Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF04C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 10:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C0A10E118;
	Mon, 31 Mar 2025 10:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Myqs0fP2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4195C10E118
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743417955; x=1774953955;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vsc35SKc0Y3OZ5f1oK7plU6ejhG7VvPmKPzetrKOSqg=;
 b=Myqs0fP2erbhZvSIcQySOayHDgEIkf4Qu8fdxH2oKeIYdOXizTcR8GP2
 V3MfMbY3G4JAI0uPDbADBlZniyRiP0q7Bgi9KZoZPaFeCa4L9Ax9u9UCa
 mUDQIAwYrMVyWqJw5Lr+Pkm0XAFiO6/LkurFl4I1rfj+68P5qxoW60HwB
 uOYrtHf2+RdKD3XaIExmksXpcHiZ+K5RJRBOkTChaCoAN5xsGwi31n0Xj
 xPx5KSew0RfkJZeZUvflu1TiDZIVGWPv9VzjLmGv+ml4uHjXAwM6WXvGS
 x1S29ZNyVfH5QCPfCNigPRzJqClyBBbjIdLT61b7VUN+Nm7rB3q6v41Kd g==;
X-CSE-ConnectionGUID: WVOPNOgwTFOXmW8efOO0VQ==
X-CSE-MsgGUID: PDjWX/xQQKGmpmAjXm0rGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="43850959"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="43850959"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:45:55 -0700
X-CSE-ConnectionGUID: 8YXiWyvsTJ6iBpYDvkUAcg==
X-CSE-MsgGUID: 1Iwn6qYEQb+7E6C1chFBMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130176050"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:45:54 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 31 Mar 2025 03:45:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 03:45:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 03:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDUPfNC7fliFm/C6wtektLI84Z2i+H7N1JjnnxkQ8lcIffKnktkT5hxzwKLtlbJiBWxUOOYj5xLeSFxfibiV27eJnvvngRb45yU447xDUPCByEgAKltu8Tc3lQXAscbEkE986MVOSTvEd5sDVjQ5RVEjJBrIh2JRqRocBjxb8cQN2yYlB1sHMud2S3TwsP6Y2fxZ5foUjnUnLzVEDj5MvsGtsROTb+DLdeSzlfRkcgsmoHi/3GBrch/3FDgxc9r8pvnc0K5xWZujc2mZVhWUlq0u0aAjq3qcqVSUUwQuIUvoYqGGf4qNMwOo4aGqZbZm/0CjPNuCt9+m7NEAYRbaCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hro0zwRkzZZQ6SbBAGHCRHdJYhKt6xKiDZRC4/YfdKQ=;
 b=sz2s/oe++GKATucHoROjfuwU0baRfZGB7h/iQPXEFauReoZZncSufuLStQcnD718AEN6Fqlh/RQLmMRPKNvy07lJoGWJFfXOCR25LuGZrYsTduv3lm+bI2QJIbqhl4Xz+K9aQvn8ZBQK7So9QvhW/WbRThuj8lLa77WIdqczAL3R6YEYrreaqMXC5Fvk/aB+/spT9GCCSuaEeEHPmI2dpilgJLu8eW0jw1hCcvD0ns4pU/2+nQjlnS6wludcIKPqc7Zp25tiuZUjzacGK4J5ae/+jGaf/veRPTutpm8JR88qlBLnIbeAMjMVXwoidfdvDdSsIaZ99nt2aMNDFxUOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 10:45:25 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 10:45:25 +0000
Message-ID: <81a189e4-cce6-405d-97b8-707f207351fe@intel.com>
Date: Mon, 31 Mar 2025 12:45:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] CONTRIBUTING: Add subscription and patchwork
 info
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
 <20250327153139.37746-2-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250327153139.37746-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0178.eurprd09.prod.outlook.com
 (2603:10a6:800:120::32) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|MW4PR11MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 38bbe55b-1619-4550-2661-08dd704124a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1JoV0NMMlZneWN1czN6Rk84bkt6WjNzNzlRODNtYTdVNDhrV0Z1TGlVUnBl?=
 =?utf-8?B?ZlJLNlpaUUlpcU1Ha0NlQ3IwdFdBd04yQk9jVHNEWlRNT0RFM1RFVUpXY1F1?=
 =?utf-8?B?QllGai9ZZTlURlFVVUhlaEk2TGdTaHBoUGxhU1VxOEVVNlEyWU1JdWNidkxR?=
 =?utf-8?B?NVBpSlNVcTB4WHNMNyt0anFLOGFSUjlHT3RxdXA0SU0ybDlUUkpXN3hQOUlD?=
 =?utf-8?B?UWJOejNLcnphYks4REErR21FeWRtM0V5azc1bnZVckpYVW1ZbitvbFZ0SzJS?=
 =?utf-8?B?bllpZUtnN1BKV0IrME9ZSEl5b1VrVEZJbjhGVWt4Q1R4SFJEc1owdnlvZGQ0?=
 =?utf-8?B?K2NZR1lndGVEb1RQa1RKL3N5RThKWW1remd5a1VabjV3dTgzV0thU0o0bWE3?=
 =?utf-8?B?NUxKUmpGV1RVL1JTeDBCbnhNd0Vyc1hxOHZDN0g2T0hBclR3VjRNSGkvUVVy?=
 =?utf-8?B?OGNmTkdZZTR2N3dSbE5oTWJXczlkWjBmV3I0ZjQzeWUweW44cXpWanc3MnJN?=
 =?utf-8?B?VXdER3BBd2czYk5icG9xNXVnSmU3cHlmbjg5K1lRUVVJcEJtVUNyWmdHeFJi?=
 =?utf-8?B?eERZSGlGdkd1aVcxMDk2SXZhbEw5RXZydUVTUEcwVmN4aDJwc0kzWUk4VG5X?=
 =?utf-8?B?WURzdjJCbkI4SEp4eUl3a2hRcG82UFNYU054MVN2YVpONnpNMjdZd0JMWXRj?=
 =?utf-8?B?QWZIL2ozWHRkWDhldjdNYTRvVjQzV2tIeE9pY256SkMrYXQ2aXdvNmJ4VDNE?=
 =?utf-8?B?KzlYdnNDUVB3TlB0Y2tJV1hHdzRkR2xjclEybnJ6cTcvdjhDVDlNU2hucms4?=
 =?utf-8?B?ZmtMRG43Qi9Hc2VXcDdXWVlqUzF3LzdMNWh6SDhoMDFMdjN6aU1rU21Kd1FD?=
 =?utf-8?B?K0c4MTdvR2ZFcGtTSFliQ3lKd3cvczdVeVI4Qkg1aGVvWnBZbzlHemNQblJw?=
 =?utf-8?B?SFMwYVhLZTk2aUNNSmhZcEtlbFprQklqUXR1VUxVNTQ3R2FhNGdoT2UxNHFY?=
 =?utf-8?B?d1JCRU5iRkMyMlpKYzJOQ0xDbzNOclREYVhSTGdtL1B0dGxHdzVSOUY2TWxq?=
 =?utf-8?B?QWdVOVFpeXV3TkZPUGVaV2ZNUkRCN3BTUnpLSVZ5ZlRSUWNrTFVFM1orc1p2?=
 =?utf-8?B?c2hoWUpmUk0rTkpOdXRNZnNJazQ1UUpwai9IMFV0Y1ErdTVEZXBTVTlMaGRS?=
 =?utf-8?B?UXlDOFgvOHBLSjFEUmE0ZjUvMTl1RmgzaDc5NzBBUFVtNkc2UnBDeHlMWHlB?=
 =?utf-8?B?YzJic3dwYUs1anRJbGNZbmN2Qys3eTFNWGNuc1ZhcURYZCtVYnZ3N2dXcUZz?=
 =?utf-8?B?c0h2QlBlZ3ZnQnNhd3N2YVMwYXVid3ZVZmx1SHdlMGdLaFBLK1lEY0tRUi8v?=
 =?utf-8?B?NXFyc2hha3hUUTl1aHpXcWMyRVowSVk5V1hXc21LSjJ0U2hsVEFzYUMxZVVR?=
 =?utf-8?B?WnRqdEg4ZVZqa0t5b2hXRENialpOSndYUTlnd25zK3F3NFRwR0VRRUd4VVRJ?=
 =?utf-8?B?VnBUenRFSDhCY2E1YXc0R044Wmt0bnNuY3dRdTFGdTVwSWNJS3YvMHRNbks0?=
 =?utf-8?B?a243Snd6ZVNQaVo0Skx5VDVJQjEwL3Q4WUMvVTFOWU9DM2tUTkJ2MmRIbmdu?=
 =?utf-8?B?K0N3SzEwL1lyZnNZcTRUTEpHd1pqdGhHdURXYU0zY2VwdTdEZUZHWmlmNTJZ?=
 =?utf-8?B?SWNMdWJKZDJIOTZmQmJrY0FRSjYxK0pYUjVVUEhzQm5wQjJqbE5GQXJhQlk5?=
 =?utf-8?B?cm0vNG0yUEp3VU5KYUtFK0xyUWs0RWV5WVprZ3UvTFd0MUVld2xMSENMNmp5?=
 =?utf-8?B?VkNaK0szK3VmTlI3M2hEUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEhCZHh0TnhqLzFOcklObHN0OUlKdGk1ajAxOVh0Z2YrbXpFMGEzbmY3VUNF?=
 =?utf-8?B?QURNZDMzYURQNnBDMVYyaklyTTdKR3VRV1hzbHZ2dExWSlZxMXNtK0liRDRO?=
 =?utf-8?B?R3FEZGpRc1NTZkxkOExaRnZpSUlQNnU1NHYxM2dNMmtNYkRObTJjWTAxdFo5?=
 =?utf-8?B?Tjg3aEJIMDJuS0hHbjJBWHptMlVMYkNsVVZMQ2R4K1NDM0tRYURqaEhSbFVj?=
 =?utf-8?B?MnpLY2RkRUlZc0NNcDYrTGxYNGM5SjZPN0dsUnUxQVRPK2YwOHNiVXgrSC9C?=
 =?utf-8?B?UnZJTzhpN215KzViYm1NZ0VybU9Lc3pSNDhJY1pvVEx4YWxHdk5MYk9jYzd2?=
 =?utf-8?B?YWhxak1GczlMck9SUEZoMWtodmsvQnlpVGJLTm1tK1lxYWRtUkFpQjNlTEdQ?=
 =?utf-8?B?YW0vWTc5azFKYXhPRU5CWlMrdkY2Yi9GekpBQkJpTFdBUkhaQjJnbTFTRlBw?=
 =?utf-8?B?MnJHWGtiRnlKQlVPR1Q4eFBnQTVGNTZEaWRCN3c4WERoZVIvQkRaQVppTjZI?=
 =?utf-8?B?bFV0U0VQZHhYUzdSU014RUVoRVdKTEJ0U1hmaE13bHFlaDQrQU1DZXhRcmpx?=
 =?utf-8?B?MG1yQzFCVmVaRUlGZEZXSG5qS1BGeG9YcDdEbFp2VVV2NDBwQnRBY28wQ2Jx?=
 =?utf-8?B?YUMwS2NqYWE4U2xxK2FHMEtTTUdSS1VUazFGVWtBWCs1My9iTFVrdXdzWm51?=
 =?utf-8?B?NEtOUnBKQmx3OFVLaWhHOUEwKzVDbVVzZkQvM1dnbVpzOUhYOXRVM3pHWEJF?=
 =?utf-8?B?MTJkMUw2dGFLa1N6WUs2cktkWnNwZ0NGM1RnaHoxOTlhSEcwQnFGL0Jyalpp?=
 =?utf-8?B?WFNGalllNWwweVJoUjdvOEFsbEp0Ty9UUUtMMWdVc1BuS1M4blZKVDdtLzgy?=
 =?utf-8?B?NEpZNzVXZlEvQXpSYzNWR095bDZKVVNMN0FHSzlBV3dFWWJ3SlJEQk82Zldu?=
 =?utf-8?B?bVowSzRXYm50UmJVL0lhUnIwSFR1Y084aDQ2am1memZnWUJFdHhla2Q4RXVQ?=
 =?utf-8?B?MnRqVEFGVjlpeVBpNjVRR3VBdEFQa1IwRW5aNm9mbXZZa0dISVJxbjdSdXd3?=
 =?utf-8?B?NEJHMk1sQWh4ejVMZ21YcDZoZk55N2l4RG1PZ0czSjNZakRLYmlrcG5aK2ZV?=
 =?utf-8?B?SnJINWF0OFVoTUgvVUt2b3pDTDAwUHlCaS9mUk1EbDc2eHFTQlFhM3NWSEsy?=
 =?utf-8?B?enZEV3czMnVMZ3NhSHliOVc5NDFUUXJJdDBNTTNjcHNzYWlwZjdqMUE3QThk?=
 =?utf-8?B?ME9ySVM2eEY0MDJOUkxjcjhjblpHTk5QU0V6N09tSHRraWF5NE5DaE5kRFpy?=
 =?utf-8?B?WEQ1RjRUTDh0aVJnNTU2LzcwTDhhWUlLUTlLSzRkTjVUK21SUHlEVDJuaHdB?=
 =?utf-8?B?NjJZL2ZvZ3pkdW4vT3doMXlFS2hpUVVrMG9jYWxuTTAzQWhTaXJRZ0ZZWlNu?=
 =?utf-8?B?Z2xRMlhLYTYzN1lTMUphRnlmbUxYNmJRUUdWRDhMQ3E2dW5IQzVtSlNSeHdX?=
 =?utf-8?B?cEZCMEZNMGgrVjAyUnhKM0Vlbyszb2ttdW0ybHpyc0x3d2hhbHQ1SS8ycVNH?=
 =?utf-8?B?TWhBNHQrWmhXMVAyMXFEdG9lVGRIWkpOeG1uTWpSQkpMMkpqK3I3SjM0MlF3?=
 =?utf-8?B?WkFJQm9EMU9GQmhDd015QlExa21VWFk1RU5tdk9Td0FTRWZtcDBjTFRsdjIz?=
 =?utf-8?B?bjhVcVJhZGRvN2dXU1pQQmZxcnl3TEtKVGFwNXJ6cFJmd0h3TjA2OEF2eFha?=
 =?utf-8?B?QUZIZEtibUhEM1l6cnhwekF0WGoxSXdicUVnWS9wTHVBSTlkU1NHSk02c0Ji?=
 =?utf-8?B?bVRIWTZzTkdVYXVJME4wTzhGbzhVS3V2TmEyYnZnb2J0RWROQUVjZXlVOUEx?=
 =?utf-8?B?eFBEQmJzYnpIYVVpaGFiaWVUL0NVWVVSdysrV0x4K0dOZmREUmJ5N2NTOGpG?=
 =?utf-8?B?Q0d0akphcXRQTWc5emdvTHVrNlc5OE8xaGc5elpnU1RYa0FLSHJza05SUkxB?=
 =?utf-8?B?YkZzZEtmbXhDbXJudDViVzVTZ0l6YXVuM09yQmlXcjk1TjlJK3M0Z1oxRHlZ?=
 =?utf-8?B?MDUzdGw1N3JLNE1lalR6Z05CMjRLakxBdjhkY0ZpRmhNRSttWmp1YVpXK21K?=
 =?utf-8?Q?a5lfPIbEjTtfszI2IJyuED1D3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bbe55b-1619-4550-2661-08dd704124a9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 10:45:24.9175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ACUxhJ662egTNlIenTCWtA9hXSWHM2EqCfd/OWuBUjZEZYuVKz45K1TD5qEFB9lFRANDeCuAx4R/5FFi+ANKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
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


W dniu 27.03.2025 o 16:31, Kamil Konieczny pisze:
> Add guide and link to subscription into mailing list and link
> for patchwork.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   CONTRIBUTING.md | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 81057a2ad..b571b5e68 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -63,6 +63,13 @@ Sending Patches
>   
>     on its first invocation.
>   
> +- If you plan contribute regularly please subscribe to igt-dev mailinglist:


s/plan/plan to/ ?

s/regularly/regularly,/?


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> +  https://lists.freedesktop.org/mailman/listinfo/igt-dev
> +  When you are not subscribed, please note that your contribution will take
> +  more time to reach to mailing list. You could find out if it was delivered or
> +  what is a testing status of your patches at patchwork page:
> +  https://patchwork.freedesktop.org/project/igt/series/
> +
>   - Place relevant prefix in subject, for example when your change is in one
>     testfile, use its name without '.c' nor '.h' suffix, like:
>     tests/simple_test: short description
