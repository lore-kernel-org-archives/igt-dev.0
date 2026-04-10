Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95603F44868
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 13:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474AA10E975;
	Fri, 10 Apr 2026 13:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crMHudDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8830B10E95E
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775829419; x=1807365419;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=+bdBAhTcyurnlTqReBsxsKKtzUms/OouBSv4meUfDYA=;
 b=crMHudDDTwHiH9JosJIBFaMBK4hUPn95diFl+jMjrq8i1lVUkOT7W2Ho
 zqHU8IPt/RbtA+55sCwwlrHFQEkExXiaKOHNP2P4tF1Iy9128BblGMVl0
 TbwmxsmVqpe/tWjSr8Sz20pX7yRnBGCu4rqnEnMVy2B40DjYqneaoYuLt
 wcYPYIrmtOXuEmqbYv2iVWcvkCn5dCi/JJumcqInZ0mWAijaIB4ZS2v69
 YA4epvVSGDFkdoDLhWvCqsewo3jHkIwBLTKHIhPdTLYS/VGrRx+O/yX5v
 7NWqm5HRohMRUNrEbfPMwyB+JLNyEaRyO65T49a24EKvF6EpdIk8h89yG A==;
X-CSE-ConnectionGUID: C2nNaAX3S5GiWBE5zk9e+w==
X-CSE-MsgGUID: pHfSt8raQNKIsxyxN4Pu6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102305304"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
 d="scan'208,217";a="102305304"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 06:56:59 -0700
X-CSE-ConnectionGUID: inqZHUiQSy2uXxq7FQ7hTw==
X-CSE-MsgGUID: dD57HCHfR9a5/9OlB6A8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
 d="scan'208,217";a="230814701"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 06:56:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 06:56:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 06:56:58 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 06:56:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/fmg0Awhx4fURgfZYKUpr+I26wBTqpII2wkOXe/+ck9tl88N04cAxwLDbTPMfNQ78B6LHfuE0GDmhQiQi/8lAObQZM4yEX2AqyDDbsFohip0DNuZCBikuuWlZhpqC2X2SDLrWotyoDv2i69Ja+kJInawy0hukOTVoQS92nvcS6h3LqXM+NMzkQsWm2vRYmKCy20c8w74kzvtqCW6lA1EXIhUhqct45lCiUCa/KUXEeLNwDWSXfrOtzuBc/gfCKpFXnb8qpRh7wiiyjgJqEOf7Lowctb7R6jC2W3RWk49ubPyz116mM95Fsg6xyCJ9kEo3z3U2bF9oCD3UD8n/o7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xa14FXLI0KM+Clfyj7JfhxFjPLUwFQxl94R8I9NDuiA=;
 b=DsCXVw+ApYMfdFhyfM9Hp5QgnJTxJL2ibfUA2XtUnnAqcUwpWfxYSBIBRtJ9+ZcjQUE4WJ80MClJ1Lmp09alwvMBqPlsjCDHwFBio9H24rHl1vJNfputdbhUoJjQpbWX0tNnzUEHE3Z/pM6Bed5OWPkFqApleL9VP/vK3vjfzSKzXUU00TmcX3fh/1IRsKKmCpE7jv89/NzEzH4ztP5c4bH1QpndIy97tLxs9UjmRtO0Vz/U9WRM02obAnk63bKV8X5z/LVVtVV6TX2l4DdBk47NE04ZJ7wdHBbnVDSAtOGDk1sUoMw/BrTFe60lnzOa1fgn3vF8RfQ1vw1ETpQqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 13:56:56 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9791.035; Fri, 10 Apr 2026
 13:56:56 +0000
Content-Type: multipart/alternative;
 boundary="------------Lxbwp0ZK5sDteby7oq00z0Qg"
Message-ID: <fe33dfbb-220f-4f27-b302-2f5e1c6ad4c2@intel.com>
Date: Fri, 10 Apr 2026 19:26:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/1] drm/xe/xe_pm: Have high VRAM usage during
 system suspend
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>
References: <20260331181356.4133309-1-karthik.poosa@intel.com>
 <20260331181356.4133309-2-karthik.poosa@intel.com>
 <ea87318d-3405-4083-a5d9-b4a04ce91343@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <ea87318d-3405-4083-a5d9-b4a04ce91343@intel.com>
X-ClientProxiedBy: MA5P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::7) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc5de07-0884-41af-06d3-08de97090736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: EjjK1eKZTZIEZEtNZ3zqrsTFDCQjq8Mc+ce0ds2qxubEzeeX3eWAMgX/Dkkss9KOy2XFfJ30HXfy/PktD+yy0pJqem9ibqM9AMXEKECjvAUtVndmvfk1m0ncUq/h6lSVKH4UxSp0seakRBIC1W6+HXfpVtgKvxrADN/As5sPjzZLSOlpu/+ohDbNazbY93owtbhHhxpKEw1+2G8aWylFjL1/kPb+TAYqI2KTh6c2e0QCHUooZtkkgH1v78+3+yHl/Vd+vX5dLJQtcVaz4xNhgh5bXwEd+JgykV6NwR35CWPf/n0twCPHhRou80eCk/cl68FsyvedphhbSg3KD9ocxIL/CMaTYbWBTW/lqjCRqqqcGp4OHiVdF2IaVdSemQlDpjyMeuUvRZNWSnJqiOYD7APZS4xYljS2N4rHa61sn+GUxqrLSVOOXqHvby0RH1QpQX6cbYavCWYx8K2FQ+fm3GrtCbz/SAWNr6RBCscmgSmewEDxEO9MdopPU8QsDEVbWbIr+C/BC0JBsSirMZ77QemZXtXYYcql3B+PwVw4D2oldNCvgFxpzEHzJWq01mKOkPCar6nd3Drs84q0yhk/P95s89LxBGPZXt3d5L8ke4W8bWYzcwC9YjqP6nob0QTkaEzjiuTkYo6ELxZMUVpKv80i227EhJtk74my2xPasXQOT+SuAWRYJcodCEYHLzpM++Etx96w95deSkB6dmnJ5JEoVSHZG1pk1BGQzG7ONr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L085RkRNTWdsWHRSc29XWXR4NW4rTnJ0TUZiQWs3RDlESGZSLzZLVkFGTURU?=
 =?utf-8?B?NTYvMlBnZVk3bS9Lb21ROXpOY3BNNXNMSFV1aWl5endGRkdQVWFpOTQ0STg4?=
 =?utf-8?B?aWZNZ294L3NQTkRlc21lV2hFNDFOMDFNdTU4NkhnVWFkR3hzR1Y2NlArMlZo?=
 =?utf-8?B?ZTIrVlV6Vy9vSGp1dHBLZ09hYVZ6czI5TWprK0pibDVkcnhITDV5YkprSjlr?=
 =?utf-8?B?SVdWdG14MXlSRXpSN3dhOGkxbm43dndEeWU3RkNyZjE1TjZDM3YvTkhyK2F4?=
 =?utf-8?B?ay9oMUNTS2hMRG1tZU1ZOXJVd3pMdHdBRXZ4YXd5QmMyTXV3MkkycThtaFE1?=
 =?utf-8?B?anVlTk5ETzdXTHNYMG9taHEzZ3N1NmswM0s4aEN5YUlvei9BMlhJeHpNNGpG?=
 =?utf-8?B?L21WZHlyeHVwcUZKQjJCYkcyd0lEUkpqd1V6elFpZzN3anVJeW5oUDY1TjNp?=
 =?utf-8?B?V1EvZEd1UmY0dTBwRHF1TVBIOHA5VGhueGZuTnkycEZuV2lTMEhWVkZ0Rk8x?=
 =?utf-8?B?SGUralUyM3dQWHl2NjR2RXZxT3o0SmJPOFJXMnlEN0FrdmF6TDdiVnlvei9Z?=
 =?utf-8?B?dFFVeEwxbW9ENGV2Qm9oYzYxWG9MWXdsUzdRWGkvTFVZbVdOVDQ4Unp6QlRS?=
 =?utf-8?B?KzFhWWNoUWF6ZGRHZjFvZ0RSdUVGa1JBUThraFFwZUFmUUdXOW4xR1NTTnNC?=
 =?utf-8?B?a2hidU4zaEh1eGE0azJqaWRxcE4xd1dMME1lRjVYbEE3aE9xLzJDSUIzQVJF?=
 =?utf-8?B?SUVHYkFub0NrV2F1S21qNk9Sekt3NXVkZFI3R0NjSTVLc2Y2bDJicUIvN3Qx?=
 =?utf-8?B?N1ZqZ1hNcW1jcVUrR1YwYkNTa1VOTjRVL1V5Wis5M1NhaU5ETjE2amtZMU0z?=
 =?utf-8?B?OERhM3l6eWpTQ3hIam9nRm9BUXgzWExSSDIzSW5PMk5tSUVjTUdzalo4TFNy?=
 =?utf-8?B?MFUwZFl5d0FNb3ZsR3BTeStKYWFWVGZHa0xTMHhERm9TZGlMQkFXVGo1dkZs?=
 =?utf-8?B?ZS85RjdxenlFVzl0My9NQU5Nd0dzRjBpbmMzV05EQ05paFFSNHdJSE9hVWo5?=
 =?utf-8?B?UzliY0IwWUFMNEtZSTU1WEZGV3UzdDlQVHp1QlY1dUpPOTE4eUN2TW4xRUhE?=
 =?utf-8?B?ejRXdjJCMDJwSDBZU0Q1blpVd1NhMGJ6ZTlYY2w3VWlKSVd4ejZLN3Jnb2Mz?=
 =?utf-8?B?c0w2SEZjTlVZeTdGUklaU0RwK1dTT0VnN3Jyb0llWmVIYWNvZXlWc1k5YnF0?=
 =?utf-8?B?ZitaeHNSaWtTeTdlWUVINU93Z1VSd3IvMVVOT1g0WTAxYWUrUldPMlZpWkly?=
 =?utf-8?B?amhHektzT2tPUlFLMzBPbkt6d3JrOVRDOGJIUDVlbUNFK3djMlhHWmE1MHBX?=
 =?utf-8?B?QTN3ZjBCbUp3Z1AraVcxU3lSa3dwRDY3QXhMNkt1R0NBTjVOMDRtd09pOUJa?=
 =?utf-8?B?dUJNaHNxYmY1cHBFMGMxMzJFRlRFZVZId1FPN3VHVk43NGZ2YW54WTl5d0xK?=
 =?utf-8?B?ZWluNVhTZk16STdtQUVJa2pPUHhneTI0U3A4NlRCS1dpNExUdzNUODBSazFi?=
 =?utf-8?B?Sk9aRERwVm0vRTN0YldFMmVNdUMyVWtFYUphS1RQcW03UnA0d3Vva3ovaW5E?=
 =?utf-8?B?czIwV1dQMERHaE5TeFU5N0MrLzMrYUVQczZkeHUyS3JqaElnK0tmSk0zMVlW?=
 =?utf-8?B?cG50Zys4c1dONzRrcTAxVG1TUUpQZUVCdVlmaytJdk1KSTNCUTMwbVkzOGZT?=
 =?utf-8?B?V1Bua2EyRkF5VGdpRC9nZUN3aE1EYUhrQUJhMlNXNW5ZclVRTUczamcwN29v?=
 =?utf-8?B?eHVBZk50SmY4ZXF5K3gvcUlmT2pjblpvdHYxbzFFQ2kwOTFlc280cmcxZllQ?=
 =?utf-8?B?QnlPQlJMVDUzTXNTTmY5SzFjZ0tPV01SVVZPTU4wN2M3RnRJN2VYb0EyTTZo?=
 =?utf-8?B?SUc1U3lxMUpzTWZEbWZheGhPR2pPZDE1ZlI0N3E0MXd3aUFWRjAwb2ZWQW9m?=
 =?utf-8?B?RVNMa28wZ2hCSHVkSWVXK3BLTitoRmNYN2RKN0V6aER2Z3F4UEZjVDNWKytw?=
 =?utf-8?B?MjR6bjF6dXVFbFRoMFFBenREMVBKTmxTWjl2YzluMDVNaVl5RzlheUhKKzVV?=
 =?utf-8?B?OEJjNVJFRkhIOWMyT09BeEwvaEJwY0MrblFERTAzbHI5OHcyZGlxMi9HUnhw?=
 =?utf-8?B?NVc0bmVWVEZjK2pyUGUvR3Y4T2djZmhKZCsvNEpRenJXUU1PbnJEQ2pma1dw?=
 =?utf-8?B?NlFRZDlzV2FtcmpUS1JNZ3pxVnJUcXQ5T1h1MVNuZDEwMllocENQRlJHWWhh?=
 =?utf-8?B?Rm9FYXZ2QndRam80NUZEaEkrZ2FIWDBJN3RDbUw1bExuTEErSENadz09?=
X-Exchange-RoutingPolicyChecked: f4mdey+94rFVusHra7EkSdCuywtY8L5FCAKaMh48Ts8/+5Ypk8pEdPi/YoipEZc+eaypLf7oEp3kKow+IB8nbGGnR8Ugun9kphKWEUCAiBr1qdo0UA70ZrXaWZjVvQNCw9u7NVTQEaDEo/pq1H1NqrAnGR6SSfJGMO5+NLbtxgAMI4kzdid0xZfWXSXJuRH9Uuc2ivQ/1M84YfCeEvt+m61zMUwlE5sWD8u9v5L0qFOphpZvCH4nQ/0d9SVeqQWgyjzKR8/9yrkpWrg5aoGYptNYLw9GPlv+CCLep7wFpMP4gxtAML/AP7saENs2a6/wGe2QUtKGDrqTR9U0tF+pbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc5de07-0884-41af-06d3-08de97090736
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 13:56:56.6645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARMp2GoNYnKyn1tlKQLstq5ukoPpG+SeiryQS663GeGaPo6cLT8VU93HL940Aar+HPMuPuCeUgc0Kz/lmBpnbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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

--------------Lxbwp0ZK5sDteby7oq00z0Qg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 01-04-2026 15:59, Matthew Auld wrote:
> On 31/03/2026 19:13, Karthik Poosa wrote:
>> Create high VRAM usage by allocating a large BO prior to system suspend.
>> This increases eviction time, helping to expose any unknown issues in 
>> the
>> suspend‑resume flow.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   tests/intel/xe_pm.c | 86 +++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 84 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index 54f2e9d18..bff3b1cac 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -69,6 +69,8 @@ static pthread_cond_t suspend_cond = 
>> PTHREAD_COND_INITIALIZER;
>>   static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
>>   static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
>>   static bool child_ready = false;
>> +uint32_t *map_large_buf;
>> +uint64_t buf_size = 0;
>>     typedef struct {
>>       device_t device;
>> @@ -871,6 +873,75 @@ static void i2c_test(device_t device, int 
>> sysfs_fd, enum igt_acpi_d_state d_stat
>>       close(i2c_fd);
>>   }
>>   +static void alloc_large_buf(int fd_xe)
>> +{
>> +    struct drm_xe_query_mem_regions *mem_regions;
>> +    uint64_t vram_used_mb = 0, vram_total_mb = 0;
>> +    struct drm_xe_device_query query = {
>> +        .extensions = 0,
>> +        .query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
>> +        .size = 0,
>> +        .data = 0,
>> +    };
>> +    uint32_t bo, placement;
>> +    int i = 0;
>> +
>> +    igt_require(xe_has_vram(fd_xe));
>
> IIUC this is going to now skip the entire subtest on igpu?

This may not be required, as eviction happens on igpu also.
The code was carried over from another test.

>
>> +    placement = vram_memory(fd_xe, 0);
>> +    igt_require_f(placement, "Device doesn't support vram memory 
>> region\n");
>> +
>> +    igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, 
>> &query), 0);
>> +    igt_assert_neq(query.size, 0);
>> +
>> +    mem_regions = malloc(query.size);
>> +    igt_assert(mem_regions);
>> +
>> +    query.data = to_user_pointer(mem_regions);
>> +    igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, 
>> &query), 0);
>> +
>> +    for (i = 0; i < mem_regions->num_mem_regions; i++) {
>> +        if (mem_regions->mem_regions[i].mem_class == 
>> DRM_XE_MEM_REGION_CLASS_VRAM) {
>> +            vram_used_mb += (mem_regions->mem_regions[i].used / 
>> (1024 * 1024));
>> +            vram_total_mb += (mem_regions->mem_regions[i].total_size 
>> / (1024 * 1024));
>> +        }
>
> Will this be well behaved on multi-tile? Maybe add a break on the 
> first instance?
You mean PVC ?
I think irrespective of tiles this should work.
>
> Also will this potentially run into issues with RAM sizing? When we 
> move stuff out of VRAM we kick it out to RAM, so needs to fit.

You mean we can evict only max size of RAM out of available VRAM ?

>
>> +    }
>> +
>> +    igt_debug("Before large_buf alloc vram total %lu MB, used 
>> vram_used %lu MB\n", vram_total_mb, vram_used_mb);
>> +
>> +    // Allocate a BO of the size of available free VRAM
>> +    buf_size = (vram_total_mb-vram_used_mb-1)*1024*1024;
>> +    buf_size = ALIGN(buf_size, xe_get_default_alignment(fd_xe));
>> +    igt_debug("Creating large_buf of size %lu MB\n", 
>> (buf_size/(1024*1024)));
>> +    bo = xe_bo_create(fd_xe, 0, buf_size , placement, 
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +    igt_require(bo);
>> +    map_large_buf = xe_bo_map(fd_xe, bo, buf_size);
>> +    igt_assert(map_large_buf != MAP_FAILED);
>> +    memset(map_large_buf, 0, buf_size);
>> +
>> +    for (i = 0; i < buf_size / sizeof(*map_large_buf); i++) {
>> +        map_large_buf[i] = 0xDEADBEAF;
>
> Is this not going to be too slow, if this massive BO? Also do we need 
> non-zero pages for this scenario?
Non-zero pages also should be fine here.
>
> Other option is maybe creating a few hundred small VRAM BOs, and then 
> trigger suspend. I think that was roughly my original repro. Main 
> thing is just to somehow get a good number of GPU jobs from the 
> suspend, with the hope that at least one is signalled but not yet 
> freed. There should be at least one job per BO. Big BO also works 
> though, with roughly one GPU job per ~8M. Maybe if we go with one big 
> BO we can make the size something like ~80% or perhaps even way 
> smaller? RAM sizing is one concern, but also some small allocation 
> triggering eviction before the suspend kicks in. It might be that 
> going really big doesn't actually help much with hitting the race.
Okay, then we can try multiple GPU jobs of each 8 MB BO size.
>
>> +    }
>> +
>> +    query.data = to_user_pointer(mem_regions);
>> +    igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, 
>> &query), 0);
>> +    for (i = 0; i < mem_regions->num_mem_regions; i++) {
>> +        if (mem_regions->mem_regions[i].mem_class == 
>> DRM_XE_MEM_REGION_CLASS_VRAM) {
>> +            vram_used_mb += (mem_regions->mem_regions[i].used / 
>> (1024 * 1024));
>> +            vram_total_mb += (mem_regions->mem_regions[i].total_size 
>> / (1024 * 1024));
>> +        }
>> +    }
>> +    igt_info("After alloc vram total %lu MB, used vram_used %lu 
>> MB\n", vram_total_mb, vram_used_mb);
>> +
>> +    free(mem_regions);
>> +}
>> +
>> +static void free_large_buf(int fd_xe)
>> +{
>> +    igt_info("Freeing large_buf\n");
>> +    if (map_large_buf)
>> +        munmap(map_large_buf, buf_size);
>> +}
>> +
>>   int igt_main()
>>   {
>>       device_t device;
>> @@ -925,26 +996,34 @@ int igt_main()
>>       }
>>         for (const struct s_state *s = s_states; s->name; s++) {
>> +
>>           igt_subtest_f("%s-basic", s->name) {
>>               enum igt_suspend_test test = s->state == 
>> SUSPEND_STATE_DISK ?
>>                   SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>> +            alloc_large_buf(device.fd_xe);
>>               igt_system_suspend_autoresume(s->state, test);
>> +            free_large_buf(device.fd_xe);
>>           }
>>             igt_subtest_f("%s-basic-exec", s->name) {
>> +            alloc_large_buf(device.fd_xe);
>>               test_exec(device, 1, 2, s->state, NO_RPM, 0);
>> +            free_large_buf(device.fd_xe);
>>           }
>>             igt_subtest_f("%s-exec-after", s->name) {
>>               enum igt_suspend_test test = s->state == 
>> SUSPEND_STATE_DISK ?
>>                   SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>> -
>> +            alloc_large_buf(device.fd_xe);
>>               igt_system_suspend_autoresume(s->state, test);
>>               test_exec(device, 1, 2, NO_SUSPEND, NO_RPM, 0);
>> +            free_large_buf(device.fd_xe);
>>           }
>>             igt_subtest_f("%s-multiple-execs", s->name) {
>> +            alloc_large_buf(device.fd_xe);
>>               test_exec(device, 16, 32, s->state, NO_RPM, 0);
>> +            free_large_buf(device.fd_xe);
>>           }
>>             for (const struct vm_op *op = vm_op; op->name; op++) {
>> @@ -962,8 +1041,11 @@ int igt_main()
>>               }
>>           }
>>   -        igt_subtest_f("%s-mocs", s->name)
>> +        igt_subtest_f("%s-mocs", s->name) {
>> +            alloc_large_buf(device.fd_xe);
>>               test_mocs_suspend_resume(device, s->state, NO_RPM);
>> +            free_large_buf(device.fd_xe);
>> +        }
>>       }
>>         igt_fixture() {
>
--------------Lxbwp0ZK5sDteby7oq00z0Qg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 01-04-2026 15:59, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ea87318d-3405-4083-a5d9-b4a04ce91343@intel.com">On
      31/03/2026 19:13, Karthik Poosa wrote:
      <br>
      <blockquote type="cite">Create high VRAM usage by allocating a
        large BO prior to system suspend.
        <br>
        This increases eviction time, helping to expose any unknown
        issues in the
        <br>
        suspend‑resume flow.
        <br>
        <br>
        Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; tests/intel/xe_pm.c | 86
        +++++++++++++++++++++++++++++++++++++++++++--
        <br>
        &nbsp; 1 file changed, 84 insertions(+), 2 deletions(-)
        <br>
        <br>
        diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
        <br>
        index 54f2e9d18..bff3b1cac 100644
        <br>
        --- a/tests/intel/xe_pm.c
        <br>
        +++ b/tests/intel/xe_pm.c
        <br>
        @@ -69,6 +69,8 @@ static pthread_cond_t suspend_cond =
        PTHREAD_COND_INITIALIZER;
        <br>
        &nbsp; static pthread_mutex_t child_ready_lock =
        PTHREAD_MUTEX_INITIALIZER;
        <br>
        &nbsp; static pthread_cond_t child_ready_cond =
        PTHREAD_COND_INITIALIZER;
        <br>
        &nbsp; static bool child_ready = false;
        <br>
        +uint32_t *map_large_buf;
        <br>
        +uint64_t buf_size = 0;
        <br>
        &nbsp; &nbsp; typedef struct {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_t device;
        <br>
        @@ -871,6 +873,75 @@ static void i2c_test(device_t device, int
        sysfs_fd, enum igt_acpi_d_state d_stat
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(i2c_fd);
        <br>
        &nbsp; }
        <br>
        &nbsp; +static void alloc_large_buf(int fd_xe)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct drm_xe_query_mem_regions *mem_regions;
        <br>
        +&nbsp;&nbsp;&nbsp; uint64_t vram_used_mb = 0, vram_total_mb = 0;
        <br>
        +&nbsp;&nbsp;&nbsp; struct drm_xe_device_query query = {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .extensions = 0,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .size = 0,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .data = 0,
        <br>
        +&nbsp;&nbsp;&nbsp; };
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t bo, placement;
        <br>
        +&nbsp;&nbsp;&nbsp; int i = 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require(xe_has_vram(fd_xe));
        <br>
      </blockquote>
      <br>
      IIUC this is going to now skip the entire subtest on igpu?
      <br>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">This
        may not be required, as eviction happens on igpu also.&nbsp;</div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">The
        code was carried over from another test.</div>
    </p>
    <blockquote type="cite" cite="mid:ea87318d-3405-4083-a5d9-b4a04ce91343@intel.com"><br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; placement = vram_memory(fd_xe, 0);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require_f(placement, &quot;Device doesn't support vram
        memory region\n&quot;);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY,
        &amp;query), 0);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_neq(query.size, 0);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; mem_regions = malloc(query.size);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert(mem_regions);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; query.data = to_user_pointer(mem_regions);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY,
        &amp;query), 0);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; mem_regions-&gt;num_mem_regions; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mem_regions-&gt;mem_regions[i].mem_class ==
        DRM_XE_MEM_REGION_CLASS_VRAM) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vram_used_mb +=&nbsp;
        (mem_regions-&gt;mem_regions[i].used / (1024 * 1024));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vram_total_mb +=
        (mem_regions-&gt;mem_regions[i].total_size / (1024 * 1024));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
      </blockquote>
      <br>
      Will this be well behaved on multi-tile? Maybe add a break on the
      first instance?
      <br>
    </blockquote>
    You mean PVC ?&nbsp;<br>
    I think irrespective of tiles this should work.
    <blockquote type="cite" cite="mid:ea87318d-3405-4083-a5d9-b4a04ce91343@intel.com"><br>
      Also will this potentially run into issues with RAM sizing? When
      we move stuff out of VRAM we kick it out to RAM, so needs to fit.
      <br>
    </blockquote>
    <p>You mean we can evict only max size of RAM out of available VRAM
      ?</p>
    <blockquote type="cite" cite="mid:ea87318d-3405-4083-a5d9-b4a04ce91343@intel.com"><br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_debug(&quot;Before large_buf alloc vram total %lu MB, used
        vram_used %lu MB\n&quot;, vram_total_mb, vram_used_mb);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; // Allocate a BO of the size of available free VRAM
        <br>
        +&nbsp;&nbsp;&nbsp; buf_size = (vram_total_mb-vram_used_mb-1)*1024*1024;
        <br>
        +&nbsp;&nbsp;&nbsp; buf_size = ALIGN(buf_size,
        xe_get_default_alignment(fd_xe));
        <br>
        +&nbsp;&nbsp;&nbsp; igt_debug(&quot;Creating large_buf of size %lu MB\n&quot;,
        (buf_size/(1024*1024)));
        <br>
        +&nbsp;&nbsp;&nbsp; bo = xe_bo_create(fd_xe, 0, buf_size , placement,
        DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require(bo);
        <br>
        +&nbsp;&nbsp;&nbsp; map_large_buf = xe_bo_map(fd_xe, bo, buf_size);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert(map_large_buf != MAP_FAILED);
        <br>
        +&nbsp;&nbsp;&nbsp; memset(map_large_buf, 0, buf_size);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; buf_size / sizeof(*map_large_buf); i++)
        {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map_large_buf[i] = 0xDEADBEAF;
        <br>
      </blockquote>
      <br>
      Is this not going to be too slow, if this massive BO? Also do we
      need non-zero pages for this scenario?
      <br>
    </blockquote>
    Non-zero pages also should be fine here.
    <blockquote type="cite" cite="mid:ea87318d-3405-4083-a5d9-b4a04ce91343@intel.com"><br>
      Other option is maybe creating a few hundred small VRAM BOs, and
      then trigger suspend. I think that was roughly my original repro.
      Main thing is just to somehow get a good number of GPU jobs from
      the suspend, with the hope that at least one is signalled but not
      yet freed. There should be at least one job per BO. Big BO also
      works though, with roughly one GPU job per ~8M. Maybe if we go
      with one big BO we can make the size something like ~80% or
      perhaps even way smaller? RAM sizing is one concern, but also some
      small allocation triggering eviction before the suspend kicks in.
      It might be that going really big doesn't actually help much with
      hitting the race.
      <br>
    </blockquote>
    Okay, then we can try multiple GPU jobs of each 8 MB BO size.
    <blockquote type="cite" cite="mid:ea87318d-3405-4083-a5d9-b4a04ce91343@intel.com"><br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; query.data = to_user_pointer(mem_regions);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY,
        &amp;query), 0);
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; mem_regions-&gt;num_mem_regions; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mem_regions-&gt;mem_regions[i].mem_class ==
        DRM_XE_MEM_REGION_CLASS_VRAM) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vram_used_mb +=&nbsp;
        (mem_regions-&gt;mem_regions[i].used / (1024 * 1024));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vram_total_mb +=
        (mem_regions-&gt;mem_regions[i].total_size / (1024 * 1024));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;After alloc vram total %lu MB, used vram_used %lu
        MB\n&quot;, vram_total_mb, vram_used_mb);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; free(mem_regions);
        <br>
        +}
        <br>
        +
        <br>
        +static void free_large_buf(int fd_xe)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;Freeing large_buf\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; if (map_large_buf)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; munmap(map_large_buf, buf_size);
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; int igt_main()
        <br>
        &nbsp; {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_t device;
        <br>
        @@ -925,26 +996,34 @@ int igt_main()
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (const struct s_state *s = s_states; s-&gt;name;
        s++) {
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s-basic&quot;, s-&gt;name) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum igt_suspend_test test = s-&gt;state ==
        SUSPEND_STATE_DISK ?
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alloc_large_buf(device.fd_xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_system_suspend_autoresume(s-&gt;state, test);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_large_buf(device.fd_xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s-basic-exec&quot;, s-&gt;name) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alloc_large_buf(device.fd_xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_exec(device, 1, 2, s-&gt;state, NO_RPM, 0);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_large_buf(device.fd_xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s-exec-after&quot;, s-&gt;name) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum igt_suspend_test test = s-&gt;state ==
        SUSPEND_STATE_DISK ?
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
        <br>
        -
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alloc_large_buf(device.fd_xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_system_suspend_autoresume(s-&gt;state, test);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_exec(device, 1, 2, NO_SUSPEND, NO_RPM, 0);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_large_buf(device.fd_xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s-multiple-execs&quot;, s-&gt;name) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alloc_large_buf(device.fd_xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_exec(device, 16, 32, s-&gt;state, NO_RPM, 0);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_large_buf(device.fd_xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (const struct vm_op *op = vm_op; op-&gt;name;
        op++) {
        <br>
        @@ -962,8 +1041,11 @@ int igt_main()
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s-mocs&quot;, s-&gt;name)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s-mocs&quot;, s-&gt;name) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alloc_large_buf(device.fd_xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_mocs_suspend_resume(device, s-&gt;state,
        NO_RPM);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_large_buf(device.fd_xe);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------Lxbwp0ZK5sDteby7oq00z0Qg--
