Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140CDCCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 05:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAC510E2CE;
	Thu, 16 Oct 2025 05:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJS2tVgJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C600010E2CE
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 05:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760593699; x=1792129699;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oFkUQ+94Y85FL0fo85sStC/2UPuL1dhsMDI8Vt3sk80=;
 b=PJS2tVgJx3Mt6LXMWZZYQ4zvrTct6wmMzjDW3BfFIoZFIAod0C+J9C8G
 14Y6zorSxZLcvYPbCQSD8UPa7SHGI6VriiSgkcTDjga3ht+OmmhAKFaad
 v+XmKlaV4cTn0wDF3nK/UfWAjCFpsEMqBxlLFT0bDlnSR5L+5p/zTIXMj
 nELiQgEsfN+zQBF7U3Pnsi8uC0yxqoYjhBbBKLPX8ig9hH4wR1s2euKZd
 NVdPFaRpi4ntzdXSaxHVKOJVrASRm/wW69ttZ3KYoLxTxuqel1viK6t52
 f92ZrJqHv64IT5I9ueOdv80Y14ZRjodxfhowbKEGUCTXSdQ5m5AvDjtRT g==;
X-CSE-ConnectionGUID: KqGXu+mHTZyjtDfA+PlB5g==
X-CSE-MsgGUID: OIAqozSsSXSoBwGdRQj5qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="50343586"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="50343586"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 22:48:19 -0700
X-CSE-ConnectionGUID: a4DKLA4EQA6+qarcr20bFw==
X-CSE-MsgGUID: QZuBKFD4TaKeY+/xg++7VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="187455384"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 22:48:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 22:48:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 22:48:17 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 22:48:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/WYyTgbUJwwHg5WGh7d9gLOy3gd0U9e7P7JDJqoLcfV7nLrNmKxhAAXyagDbuW3bfDNiKojjtgvB2p01uRsARrQ9oiawbLU00ajJDUsxullwlzw++MIXnhydvOeY6uhtzBiBUx8zbtrDD0tQM5KcTxD5HSHaSLxYZBCugwXZBGeO4QAkpCG66WYgJURH07yNzYqZhAR2/NcimIp9H/YbdqWbuRirsRlULphTbyiSzy9JnfWu+F8mQFhvD5os1SBjJ/zHJoKm06tXqWghbgOYOTRNTDJ8bxJQ7JkZ5BBicMgOADzDUSGlJdkcMEgEoYIizaMcsDwB4GKMWs5ckPuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFkUQ+94Y85FL0fo85sStC/2UPuL1dhsMDI8Vt3sk80=;
 b=iSp9PLY5FllqEmjwzdMHN1YcSiS5RuwgDzWP8e/XeImJk3MNcwnXkk8kF8EqPm/PNXtd/2nLDKc0sZmIH1i1P7GNFxoGKIOwfQMk6NgkX8G3UyY37RQG7pgMM/t/MCJZlyyM4OAuooGHWcex5ni8rMLVw27fcu84in7u9XEbfDEb1+LwgbXqkR1d+rUE3f9W4bQZGiGElscl+VvQaopz3TsEUUtuXnpf/BdcUNgB/rNzGj+T4ibUn7nFkSrGU/sgr2ZF1T9lYsRblxbrd5DOg8Ir2i0FKxMwbv89jM8X/9HFvGQPl9fPHHZXmGioN6ZOBkWO+g0OJGFFQB8fOxGzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 05:48:16 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::301f:fd22:1d06:eb4a]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::301f:fd22:1d06:eb4a%5]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 05:48:15 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel-ci : Add Xe Multigpu blocklist file
Thread-Topic: [PATCH i-g-t] tests/intel-ci : Add Xe Multigpu blocklist file
Thread-Index: AQHcPZ8nno2jWjmwPk23LfwAFdwpsLTDX2AAgADkQ9A=
Date: Thu, 16 Oct 2025 05:48:15 +0000
Message-ID: <CH0PR11MB556496F4845560515BF52CF298E9A@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20251015064406.4076-1-himanshu.girotra@intel.com>
 <20251015160356.gfqnwn5qd7jw66f6@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251015160356.gfqnwn5qd7jw66f6@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|DM4PR11MB5296:EE_
x-ms-office365-filtering-correlation-id: 3c858029-93e7-4b4d-a062-08de0c779a12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Yy94R3VuM3ppWGtELzdOLy95NjFxK0tGdURjZ1hKc0xtM2NHa0FDbncxcUYz?=
 =?utf-8?B?YXF4dEErM1loMzdUSTc2em81WHNTZm1uTHhlUFJtZUFZbjRlREhPbVUyUS96?=
 =?utf-8?B?V1lTejF4U2tZQ2dEQTFaRFRvSUQ4Q0tFQ1QwVk9zd3Nzdmx2Ukx3NThyNEdn?=
 =?utf-8?B?dk9CY3pKNE5TcWE1NHBDN2RtS2FXb204Z3d6NStacjZRTWQ4cEQwcGRLeDFY?=
 =?utf-8?B?a0krTXBGSkJBNU1OMFJVcTFFSEdmN2x3WEdrSFB4WEE4cGhHZmhaWUFqU01m?=
 =?utf-8?B?UkhQajBUZ2FvVTE2elNiek9DZ3hWR1I1SHZ2TDVWS3BwbmRUVU13UlNMektP?=
 =?utf-8?B?S0grdy9iYzJZMDYwS2NGaWxVaSt0ZTRIYUdwZy9TeUorYWZnaWUrYjBXUm1M?=
 =?utf-8?B?aEhtWE8xamx3emNBR09DUStIRFBrdkNBYW93Um9UWnYrM2NldkF6aGFPajh6?=
 =?utf-8?B?ODZUcDB0cmIwWUlSOHVpRlJXQzA3eEk4UDRYWjcwUUc3NDB1UEpCSC9IL2dV?=
 =?utf-8?B?c0xJM0prR3QyUjZ2QXpaUnZMM2NGL2xNK3I0Yy9Hcmd2b3RYb1hCWk1pcjNz?=
 =?utf-8?B?QTUxRWw0dmtKNG1HSzZoZ1pnV21sdzlld3RLTWNPRGdqbkVEaHBKTHJqdHRW?=
 =?utf-8?B?TEx0NUtLRlE3T1h1cUpzNkQ4ZnpISFJlSzVINXZDR2s0MDE5WjVaVlp5dCtV?=
 =?utf-8?B?TzdRbitSUDRvckptRDdXRjUzZW1wZzR4U3hQQ2M3NG91MlBNUnVLNk5WR2FJ?=
 =?utf-8?B?N0xWNjQwSkt1Zk1IQU9kSUYxdGVSQTVlU2dlQ1JIdmxkTlA2YUhNdk9rTTIv?=
 =?utf-8?B?Vm96a0lkZG5TcThuTno4cEpxQ1NyS3g5b2pTTWZVWlhvUk5vTndjbUQ5azVF?=
 =?utf-8?B?UU9CcmFibXJheWFBWmRwcytYVnlmRHV2bkNNTEVUOG1iK3pnbUIvdGRFeFFz?=
 =?utf-8?B?OUxVMmhMMGYybVk2L3B3OEdqOFkvaUlKVkw3YW56dElONHFZc2Y2YTBCMUl3?=
 =?utf-8?B?NmNUUXAvRUw4T0xUQnRwSG9zNUxWVHNwa0FPNERsZmVKYWg2WWJjUjZJNm1o?=
 =?utf-8?B?MThIeDZSaTMwQzllY2RjaE95KzdyNWN4N0xaVXB1UElnYzlEQm54RXhIcmdh?=
 =?utf-8?B?RTZPMWk4bG5VNWdnUWpqMmtpN0R5NjVLditISStXQXQ5WDI4N3A3YTROc2VX?=
 =?utf-8?B?WmlONUhxK1ZzbUlCbWJkbUVCQXR4TG5rSjRSZnlOZVpqMmtJRXBrbmtLZnhD?=
 =?utf-8?B?NmNKdktvaFJxWDYvLzh1aldQeDZFZmRZbkJ3UklLR3A4SS9yVnVLakp0TXRO?=
 =?utf-8?B?TEdxM2VMWmd0UjFRSkF5Sm8zQlFScEtxclh6SGpadWdTb2FINlRzcGx0RlA1?=
 =?utf-8?B?Sk5CWnJ1blRpMmx3OVh6WWxvN3I0NE53VDh6NEpaQmxkNFJQS1pPV2dUbDFn?=
 =?utf-8?B?dGRTd0t2UWQ1V0U3TTY1aHYzU2YvQmp0aStzMWpEeUZKUFdDQzgyc0Z0RmFq?=
 =?utf-8?B?SGhXUk9yZEdPSDZsMXNzczI3dW82bUdoR0pqWE4yREp3c1hEQWg5OXc1dkNY?=
 =?utf-8?B?WEVjMzV2QUxYZEY5SkVxbjJuZ2VkZTBxZDFmZGJmUmp5ek1hN2JTaWQzaUpw?=
 =?utf-8?B?bmVjOVozNHRMdlBwRE9EUHViQTlzTzRXcktyZ1EyRVN0YzA2SkRCdkNHYlN2?=
 =?utf-8?B?RjdZdHRGVVI2ajh1NXBKRitNNm5yYTZHc3FUeXhHNFExOXNxM3BZZFB2N1hi?=
 =?utf-8?B?MUNpYmFGa1IwclR3SUttN2d4N1BPR0dVVTl5K0pBdHJkTWpHeWRZUGVUNStH?=
 =?utf-8?B?UTdmUGhkclhhMnFXcXptZ210YkJ1QVFRNXBEU2h5UGZLMXFPTnVUNVF5QWNs?=
 =?utf-8?B?dURydWN5K0grblN4blh1MG5NYmlLcHlLNElRT215empHNlNqSE9hMGZGbVZw?=
 =?utf-8?B?ZjU3Smo0eUZCNURBYThKWVp3UlVDWE1WbGVPVFh0WWkrZE05NWViVExKY3Nw?=
 =?utf-8?B?YTdrajhVWWNQdytxa3ZoeTg2QUp6VzNyR0duckdsOWNJYU9pS2ZNZll6Q3hK?=
 =?utf-8?Q?Dyjx+F?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VCszMGFmR2JlMngxRkcyTlhrSVpPSmZsMFBSTW93eHlSN05xYS9sOU5mNnow?=
 =?utf-8?B?ZWNjMDZGVWJFeDR5djI2eXFtWnY3RW8wdWhwcFM4aFZHSHlDSUFxVmt4R2Vl?=
 =?utf-8?B?bzFmUFJYZEc2UktWcjgvc1REU0x3bDRxVXhLZmhlZzNORW84bUpSVnA2TElo?=
 =?utf-8?B?TkwxdW5jOVlJOExKMUF0a1pSWjNOOC9pZk5BOU5HblZCQ2gvQnY2MTgxd1py?=
 =?utf-8?B?TFIyU3VGbkdlQVVYa3picGtJTWdIRExTZms1RWNjbi9CMFNsVFFIWk9LSGVG?=
 =?utf-8?B?eHdBOVhkbXRUMnJpcDY4aDFGS01OZU9tVjQ5MGlvRlpUVlVmbkFwQjVGbkUw?=
 =?utf-8?B?WE1lUCsvQWlnMkZtK1ZKbG1VL0RkVGM1OU0xU3FYK1RxbTIwWndqaHhXV3VD?=
 =?utf-8?B?ZUIvQmRzcEJsUysxOERja2VtRWZuM2ExTXppakN6NG5PdElyenNYMXpHZlY2?=
 =?utf-8?B?SFNZZHE0cEtkbHNreEUrVWZwYkNORHMvOUV5Yjh6d0xOeTZvTFVJaDRheDJB?=
 =?utf-8?B?Vy9WY3JxRFpRQ01NaStzSDZRUHgrOG54ayszcnM3enFHZWoyekQ3U05QMW40?=
 =?utf-8?B?YkxSUTNuMCtpK3dySGRpZUdZVU92Vk1qUW5nbjFxdTVqRWRsTFU0dGx2bURT?=
 =?utf-8?B?ZzVFVzBuZ0JCY3lVdjIwa053dHN3VlhQQnM4VENXS1k3L3NVRFhzellRREVT?=
 =?utf-8?B?TWNSUzU1NWFUSm91d2Y0VysyZmlwRVEzWEk4Z2w1YWVybHkweXppRGV1M1lI?=
 =?utf-8?B?RGRBZjJCMzQrQS82TCtUU3lzUEZjZ0c0dlNXNCs3NWpwczYzLzNHQzBXK2p0?=
 =?utf-8?B?RHIrTTRZOVJSLzhGdkxLZytHUnlXRkZWbUhSb2JLTWFybjNzOG5mNHFsN1VK?=
 =?utf-8?B?aG05NUNwYk40Q0JGQlJNMGplbVd1eUUwM3BYYStoZkR4d3I1RVljLzBEdmpB?=
 =?utf-8?B?aFY4RWttN29JY1R4eVQvWklhb0wxWDVLcCs4OHlZTzFpTkZwVXFlUHAvNXVo?=
 =?utf-8?B?MWFJek1nbmpkQ1BpcFJjWUdQeG1kMnl0eTBlZHNtQWF0Y1VWSjdNQTJXb2Iw?=
 =?utf-8?B?OFhRSDN1bm5YWFFLR2pNZ0tyQ25nbWRYaXJRNjAzUnFDL0VPMS9WckNBdy95?=
 =?utf-8?B?anpDMXdvRnpwQXJoQisxdFhNQ3J4ZlAxdmJNelc4RE5yOFRiWWE2ZkhCZmpt?=
 =?utf-8?B?RUx4ZWgxL0F1NXVSV3NiQWVWSnVadlN3azBhbmw1YXZGaXl4Z3NtTlhUL09B?=
 =?utf-8?B?VkVGYk15UkRUbjg4aFZ1WWNwOUJsb09jZUM5R2RWVWRNNlcxMlBlN3BBb3hu?=
 =?utf-8?B?dW1veVkwR3JFcVd0UFYzT05EbHYrQ0RmR2gyejlGT3dvNjU0RXdZc0VHbzI2?=
 =?utf-8?B?SURxeUZuMHBnQ1RKcXl0dkthT0lJdFVnNGIzL3QxMGE2TEx4eVYvL1V0eEJy?=
 =?utf-8?B?M0dnUU4rV1NPbDZsTlp3MEYxR3lJeVhsMFhzVEdDYk9vVlR4QTkwdjNJWHE2?=
 =?utf-8?B?WUg4T3l0TGxoT1M0QkJFVTFGRHlDeGtoRFRJMHIweXVWUUdldEZraHdKb3Uz?=
 =?utf-8?B?dUpqUXM4eUxhNWYwWU5jeDRRcTgxTXVwNnhuSEpFTjRBTEhuaEsva2NpUnU2?=
 =?utf-8?B?K1A2N1RHbzRpVm9BU2tXaUJHMk9ITmF5bnZZQTNyMjlHa0RwY3pEVGh0NWR2?=
 =?utf-8?B?cHIwaVRlemMvbFJHdkJHT2xybGlPOEhseWV5bnhBRWt6NGRzNVlYUzFscGFC?=
 =?utf-8?B?a244V281NWkrNXdwdEsxVlY3eVd6N1JXVUFEdVNXT1NUTHRiUW1uZTZRVkM5?=
 =?utf-8?B?RDJMLzhtTEtQOHdYeGdIcGwxOHJGNzhadEZsUGVVZGtvOXNXTWlOWEFEQzky?=
 =?utf-8?B?bkJTQ2pHZXAwdjFvZjhJbVZDWXJqemNLdHMwVTYwakM4K3FsRTE4SHhkMU5m?=
 =?utf-8?B?R0dWa1FaN2JYekZSZ2pjeTB1YUJ2MkFCWW9lTHJVTlVScGR6eWJ6bkppWUU0?=
 =?utf-8?B?QTVYSDlnSFloa2RYY3dnekRRd2gzdmF1dTVyaUxMbXphcG5YUU5zTC9vUXd0?=
 =?utf-8?B?NkloNEFVU1BjMmRpY3FMS01xMUtHYzZtK09rODJzMzNqdUlnSEpGS1NRNG9h?=
 =?utf-8?Q?difQDFpsWOSDlbQsCc3zTznU8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c858029-93e7-4b4d-a062-08de0c779a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 05:48:15.8249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlFg6/NKFUo1hFB1QvVIhaKcVUJBPI6Ybm6zbGYzzShprmxD86Y59O0TOU5je6nqyVU2Lddios3TWn1dRXf2plmquGBGDzIY1S6tdAj+NrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
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

SGkgS2FtaWwgLCANCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYW1p
bCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgT2N0b2JlciAxNSwgMjAyNSA5OjM0IFBNDQo+IFRvOiBHaXJvdHJhLCBIaW1hbnNo
dSA8aGltYW5zaHUuZ2lyb3RyYUBpbnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgR2FuZGksIFJhbWFkZXZpDQo+IDxyYW1hZGV2aS5nYW5kaUBpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ludGVsLWNpIDogQWRkIFhlIE11
bHRpZ3B1IGJsb2NrbGlzdCBmaWxlDQo+IA0KPiBIaSBoaW1hbnNodS5naXJvdHJhLA0KPiBPbiAy
MDI1LTEwLTE1IGF0IDEyOjE0OjA2ICswNTMwLCBoaW1hbnNodS5naXJvdHJhQGludGVsLmNvbSB3
cm90ZToNCj4gPiBGcm9tOiBIaW1hbnNodSBHaXJvdHJhIDxoaW1hbnNodS5naXJvdHJhQGludGVs
LmNvbT4NCj4gDQo+IHBsZWFzZSByZW1vdmUgc3BhY2UgaW4gc3ViamVjdCBiZWZvcmUgJzonIHNv
IGl0IHdpbGwgYmU6DQo+IA0KPiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ludGVsLWNpOiBBZGQgWGUg
TXVsdGlncHUgYmxvY2tsaXN0IGZpbGUNCj4gDQo+ID4NCj4gPiBBZGQgWGUgTXVsdGlncHUgQmxv
Y2tsaXN0IGFuZCB1bmJsb2NrIG11bHRpZ3B1IHRlc3RzIGZyb20gY29yZQ0KPiA+IHNwZWNpZmlj
IEJsb2NrbGlzdCB0byBkaXNwbGF5IHRoZSBtZXRyaWNzIG9uIEdyYWZhbmEuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBIaW1hbnNodSBHaXJvdHJhIDxoaW1hbnNodS5naXJvdHJhQGludGVsLmNv
bT4NCj4gPiAtLS0NCj4gPiAgdGVzdHMvaW50ZWwtY2kvbWVzb24uYnVpbGQgICAgICAgICAgICAg
ICB8IDEgKw0KPiA+ICB0ZXN0cy9pbnRlbC1jaS94ZS5ibWcuY29yZS5ibG9ja2xpc3QudHh0IHwg
NyAtLS0tLS0tDQo+ID4gdGVzdHMvaW50ZWwtY2kveGUubXVsdGlncHUuYmxvY2tsaXN0LnR4dCB8
IDUgKysrKysNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiB0ZXN0cy9pbnRlbC1jaS94ZS5tdWx0aWdw
dS5ibG9ja2xpc3QudHh0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kvbWVz
b24uYnVpbGQgYi90ZXN0cy9pbnRlbC1jaS9tZXNvbi5idWlsZA0KPiA+IGluZGV4IGNhNTBlOTNh
YS4uMGMzYjc5ZDUxIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsLWNpL21lc29uLmJ1aWxk
DQo+ID4gKysrIGIvdGVzdHMvaW50ZWwtY2kvbWVzb24uYnVpbGQNCj4gPiBAQCAtMjEsNiArMjEs
NyBAQCBpbnRlbGNpX2ZpbGVzID0gWw0KPiA+ICAgICd4ZS5sbmwuY29yZS5ibG9ja2xpc3QudHh0
JywNCj4gPiAgICAneGUubG5sLmRpc3BsYXkuYmxvY2tsaXN0LnR4dCcsDQo+ID4gICAgJ3hlLmxu
bC5ldWRlYnVnLmJsb2NrbGlzdC50eHQnLA0KPiA+ICsgICd4ZS5tdWx0aWdwdS5ibG9ja2xpc3Qu
dHh0JywNCj4gPiAgICAneGUucHRsLmNvcmUuYmxvY2tsaXN0LnR4dCcsDQo+ID4gICAgJ3hlLnB0
bC5kaXNwbGF5LmJsb2NrbGlzdC50eHQnLA0KPiA+ICAgICd4ZS1mYXN0LWZlZWRiYWNrLnRlc3Rs
aXN0JywNCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kveGUuYm1nLmNvcmUuYmxvY2ts
aXN0LnR4dA0KPiA+IGIvdGVzdHMvaW50ZWwtY2kveGUuYm1nLmNvcmUuYmxvY2tsaXN0LnR4dA0K
PiA+IGluZGV4IDI1ZGE3NjBhYS4uMTVkYmJmMmI4IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2lu
dGVsLWNpL3hlLmJtZy5jb3JlLmJsb2NrbGlzdC50eHQNCj4gPiArKysgYi90ZXN0cy9pbnRlbC1j
aS94ZS5ibWcuY29yZS5ibG9ja2xpc3QudHh0DQo+ID4gQEAgLTE4LDEzICsxOCw2IEBAIGlndEB4
ZV9tZWRpYV9maWxsQG1lZGlhLWZpbGwNCj4gPg0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gPiAgaWd0QHhlX3Bh
dEBwYXQtaW5kZXgteGUzcC14cGMNCj4gPg0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gPiAtIyBFeHBlY3RlZCBz
a2lwIG9uIHNpbmdsZSBjYXJkIG1hY2hpbmVzDQo+ID4gLQ0KPiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gPiAtaWd0
QHhlX3BlZXIycGVlckAuKg0KPiA+IC1pZ3RAeGVfcXVlcnlAbXVsdGlncHUtcXVlcnktLioNCj4g
PiAtaWd0QHhlX2NyZWF0ZUBtdWx0aWdwdS1jcmVhdGUtbWFzc2l2ZS1zaXplDQo+ID4gLWlndEB4
ZV9leGVjX2Jhc2ljQC4qbXVsdGlncHUuKg0KPiA+IC0NCj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ID4gICMgRXhw
ZWN0ZWQgc2tpcCAtIHNtYWxsIGJhciBub3Qgc3VwcG9ydGVkDQo+ID4NCj4gIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+
ID4gIGlndEB4ZV9tbWFwQHNtYWxsLWJhcg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1j
aS94ZS5tdWx0aWdwdS5ibG9ja2xpc3QudHh0DQo+ID4gYi90ZXN0cy9pbnRlbC1jaS94ZS5tdWx0
aWdwdS5ibG9ja2xpc3QudHh0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAw
MDAwMDAwMDAuLjM4N2MzNDEzZQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi90ZXN0cy9p
bnRlbC1jaS94ZS5tdWx0aWdwdS5ibG9ja2xpc3QudHh0DQo+ID4gQEAgLTAsMCArMSw1IEBADQo+
ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
DQo+ID4gKyMgQmxvY2tsaXN0IGZvciBYZSBNdWl0aUdQVSB0ZXN0cw0KPiA+ICsjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ICtpZ3RAKD8h
Lip4ZS4qbXVsdGlncHUuKnx4ZV9wZWVyMnBlZXIuKikuKg0KPiANCg0KVGhlIG1haW4gcHVycG9z
ZSBvZiBhZGRpbmcgKCAraWd0QCg/IS4qeGUuKm11bHRpZ3B1Lip8eGVfcGVlcjJwZWVyLiopLiog
KSBpcyB0byBpZ25vcmUgZXZlcnl0aGluZyBhcGFydCBmcm9tIHRoZSBtdWx0aWdwdSB0ZXN0cyAs
IGlmIHdlIGdvIGFoZWFkIHdpdGggYmVsb3cgcmVnZXggc3VnZ2VzdGlvbiB0aGlzIHdvdWxkIGln
bm9yZSBtdWx0aWdwdSB0ZXN0cyBhcyB3ZWxsLg0KPiBQbGVhc2UgbWFrZSBpdCBtb3JlIHJlYWRh
YmxlLCBsaWtlOg0KPg0KPiBpZ3RAeGVfLipALiptdWx0aWdwdS4qDQo+IGlndEB4ZV9wZWVyMnBl
ZXJALioNCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+ICsjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+IC0tDQo+ID4gMi40MC4w
DQo+ID4NCg==
