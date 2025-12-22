Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B125E674AD
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 13:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B916410E675;
	Mon, 22 Dec 2025 13:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlKgfm+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A229610E675
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 13:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766408988; x=1797944988;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WbevYPdSJCbFMSwXvZWiFfFZLahCkCl+IUfqVmKgQm0=;
 b=NlKgfm+RryCbbpStmI1mf2yY/Wg/jwfzv7020zNK8HFvykLovjCX15Xb
 +bZ08bq1VjtFelwKqI5xyrdXs1Aane5cV6n41JJCE+ARFhNmCuTt33vjx
 dIIJUGfWGnS38mR3FPETCyFw+C3nvOUYipw1nZFK+Jw68Qg4QUtk4/KkK
 CyszrMfPzkY/RqAk0u7fA3gX8EY7zB2DEh64bxGsP2VLdRgsSdPyyiUwd
 50kVRlCJWqSfXAR8941FqCeJ/e8ieo9qEb+EkXmNd+cR1HEoCijQNVO1V
 BkceAQv0qVxaZeE76OUMoahCCK7T39o100qutvX9cUOE46fH1qWjVFaRt g==;
X-CSE-ConnectionGUID: ch05paj4RgqnDX+7Up2Tvw==
X-CSE-MsgGUID: bvpv1pstSAW/Sr/6dNiqJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68336940"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="68336940"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 05:09:47 -0800
X-CSE-ConnectionGUID: XnLBu7FKSGq11Bk+Wlc3yQ==
X-CSE-MsgGUID: NBkSc+lOTV6mpEN6cR0l8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="223009738"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 05:09:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 05:09:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 05:09:46 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 05:09:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdnBzQWf8hJiyuORAvEB4nwDC/8jzRWvC/q06xznDkhZ620qYo7tOIumvSjjzEjuKQ4npW0k+Ayws3fsLO+1bV/EX6bhWdstV6WaElWSJPXit2r+apGzA2I07d/iWiaWD6OaDZ/2T+e7PqqNWjwey81jg46CnpEfKWYhYNQ4H812o5DFMWnoGpXwOxthluaoJIZe5P3pTVCP8vTgCSPo6OjR9VhWuIz9aOA+ui7BJlrX3sEr3G3ifjneWe28HrUtkd6D0ByfUolLlHR4KVF6jYKI0cgdVl0m05xd9JLo5lp/QRD6gcNRgAFXwJIgAMH6u/UpLRUpqE8A9PjKjlzP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTZtqFupKftQQDxtvIzafmvkAWqFBUTNt9mBYKbndk0=;
 b=hesoJ5kOGKfcWfaHzHtVyReeofULeCh/b3ha1k0rLAss//P0XJlczZygiAlKm/dBrD+g71oQHlytGxE/qB1t97tCJlWAgJXNv6EK9M+NGBUVAHlPxUj5s5LeJqwB4Nok+JA/FtUOP8SDBhmDXOUp5MjydrrFK7CkNO1wRCz8OimXwVu7fJ/Ne2f6HbWiLQddeJ94WO2TdIgDLS2RXyaJxCW3vN89zO90ENhA2AOztzwkKC6fSwbb6893GHPCulmO9J8fHUBI7ykjfz6C2rFGkCDq563CL+cadJ/hsKOetPmP4w8f9FNVCap7cPQdWjyNnpMeRsjXuQvdncQ1bi4fXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Mon, 22 Dec
 2025 13:09:43 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 13:09:43 +0000
Message-ID: <9bd46a32-b09a-403c-98a3-b6fffbb0c185@intel.com>
Date: Mon, 22 Dec 2025 18:39:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v4 4/4] tests/intel/kms_dsc: Add force dsc and
 joiner test cases
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
 <20250905210816.319104-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250905210816.319104-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: c808bed4-9ccc-470b-2a3b-08de415b5f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDVBL1VVc3JCTGdDRkRhV0tJeEU5M0N5QVN2Tyt0MEZoeGd5c2wxdWRQckhi?=
 =?utf-8?B?RXgxT1lON2tqTzNHVWljeUNaaGNDY2lOZUhSajJjallWdjdFMDdsTkFVeWFl?=
 =?utf-8?B?VHZrOGM3emk1MmdRRTRNM0h6NjB3SEozbkp0Yy9FbWh0Ty9ITmR1YWRKUU1S?=
 =?utf-8?B?dEwvVFRJM0dsalZjazZQbDRkS0hUeVBsTjBaOEtQU0dQK1JyNVBORzlPeGF6?=
 =?utf-8?B?aDYvTDBTRldPSS93SU92NUNSdThvYlRIY0NxdWk1SjA1bG1CMXBCRTJtbEdq?=
 =?utf-8?B?Z2V1OWw5SkFkRThodm9RZkxvSDI5WExuK0IvTXRsdFF6MSsvNWtxT2theEN5?=
 =?utf-8?B?LzlSdHRxbEtzak9uMGpjMkxlNzYvcFdGWnZmaVZJR2hHc3FhNTlJRHVZbXh0?=
 =?utf-8?B?MkZuS0F0dGhRNTArY2sxdUJuTEQ1bWNSaUJFU2x5SUlMV0VKYzVJVHlqV1M0?=
 =?utf-8?B?K3NSQlRsSGorQmhaQ2hhTHJOZ2VOTThVS0J5WUJ5RVY3R21IdGp6MTYvZW15?=
 =?utf-8?B?YVVOMFU2TGtKeHdFRlhWSXJnVkJoQmdMYUtVZXV5WjhrSFRxNkl5M01XQytt?=
 =?utf-8?B?R0Z2dk5XcXoxK3hObVh6cHd2Q0w0WXIzVW9JdVZiUFNNTFA5UDJmdDdNcTk1?=
 =?utf-8?B?eCs2WXRZZ2NOZVhNL0R4Tk1CRndXOUt2NlBsVHRlTVNKZ3l6QXdpeXR1eUo5?=
 =?utf-8?B?bzU5eDhXYXJEbjF6N1d3dEd0Q3lybmpkT2pYZUhSbkE2V05lQ2pVTXY5bmdE?=
 =?utf-8?B?YTV0Z1JEU2FCdHlDdS84WTA1aFEwZEt2WTN5c2pkV28xU2ZFdExBdGs1OUVy?=
 =?utf-8?B?YlNBY0RmdWtLTExOS3o1SzRCSURMdEZ5RWJyOFB0OHlCa3VVRWx3d0NVZTFP?=
 =?utf-8?B?U1BKdzBnS2VURERHdHFaSlFCQ0dyVXNJeFAvV1N0OEZHb0ZSTzdoK1R1VEFJ?=
 =?utf-8?B?SDBlV1JBVVhYS0RYWnhwbDh6SW5IZFBNbVlaR2Q0Nzg3dktQZG13YkZLWlZY?=
 =?utf-8?B?bjJzckxrTzlPOUVLcDhBby9KSWVyV0NuYyt6bC8xVUllRWdvUVA2ZzIwMXVQ?=
 =?utf-8?B?UjhSZENaWGE5UkdJbEs1Mm8weEJNZTJqWkJWcFN4a2ZuQW5TNnJCSk9zczFr?=
 =?utf-8?B?OXNnL3hDMTFrbnhmOVFSN0ZKTHI4emRFSURGMS8xRCtTMTA2MXkvRG9uUWYw?=
 =?utf-8?B?MzRTeDdXdlBBTE56cElIcjZEaUhpVnhmWVJTWEJCWlh2Nm1xWmtITEg5YlAw?=
 =?utf-8?B?RzJjQ3MyRy9YdDNPeFdJaUp3dVE5ditJRUwrM21DbW51OXhjSnZmU0tLa3RG?=
 =?utf-8?B?SWRoZFI0bGF6S0F2Vm1FeENMK2NxeEFTU1pqZXJMSWdUalV0VUhWWCtSa2RW?=
 =?utf-8?B?eWd3VGV0VEJmMXlGaUw0ZFZaM3pKYnZHdnFSQVRoK2hBSkdzYWdDNWM1K3hP?=
 =?utf-8?B?dlJqL3UvelN3N1U4V2tiS2NOazZCTEJEalk0bmJ4UUJ3Q3NWbFAxV2tmbmJi?=
 =?utf-8?B?NWxISG1RWkN2Wm9QckgyaHdhUkh0VFM1UVZ3MGpWTUpJL2ZOa2ljQ0RKMjVt?=
 =?utf-8?B?NlBFQ1NJcGVhRy9ReTlYem1OaWtvZ1pHdDRFV3pKeVVqUHNCRDVUTXVRR0JE?=
 =?utf-8?B?SS9kemZhR2s4cXBIaEY1bXJDQ29QTS9wekd4Mzlyc2dVU21qd1U4YU5yWUtj?=
 =?utf-8?B?S1dIL1JzK2FQWms3b0FFT0JHM1RvZC83QW80ZkQ5UENvbU9KQU42WHU5ZW5M?=
 =?utf-8?B?cUQ2ZnZTWDg1QkliZzVXN2kwbCtVQmFwS014bGN5cTd2RGhmSTlqNld3bS9k?=
 =?utf-8?B?b3ZmU3pMUk5Bcm5hN1NJT054eURsb0JXTXZOY09XaXEvS3lzMUpSWnpCYk0v?=
 =?utf-8?B?WHQ0SEhnWlZOcVFSWmpCM21GVHp4TTJmbVRpeDYyY3Z2bFA4RFJiVnlSM3NU?=
 =?utf-8?Q?ZK11uU1LA0nRa50Mzc8MaG9D+Mbygmip?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1JVTC81cnFXU1ovQW5hV2tSSzliY3NKSVJwc21xdE40dERadXo4Zk1jSk1H?=
 =?utf-8?B?RmVJRXF5V3h4WjFoeWkrbjVZMGFseDN0RHBPVU92UzBoSUYydSttdi82N05u?=
 =?utf-8?B?MTdqU1UyTTRFcUkrVHJIU0xpYTljS0xCc1R5Snl1U1Zia3JHVkRhU1pmVTJZ?=
 =?utf-8?B?Z0NBUkt0a2MwUmg1bUVqSlQ1aXpSZlNFczlQdEJXNUVzUFZzQlM2dHlFRk4z?=
 =?utf-8?B?aGh1cDVkSGpSTTdSVXZ1d1MxWHJuc0wxVjlJSHdlOGZOS0VUdmxIY3ZTMHM4?=
 =?utf-8?B?aXpzUjBQbXF4UXEvbU5Md2xtelArQ25rNkN1dUp1LzE3OHFQdytIK1ppa3BO?=
 =?utf-8?B?eFlhSVZQcFhKUll1TDZFdDVEaHdtVzVJWkwvcVZMYXBZRHVjVUlMSUg4a2gz?=
 =?utf-8?B?S0F6bklLczVyQVBHcVZIOU52UUlCVDAySXNUVlZ5QlpVcGxiS2QvK1dESklt?=
 =?utf-8?B?WFRDOG5Ld3NFYVFENm5JNlRQYUtZYzJPS2VUaW5kOENXLzBrL3dBTXBsMmx5?=
 =?utf-8?B?Qzd4Z0xkWHV6OEczWE5jQXd4b0RSV2V6b3YwU0Z5cXJUNituLzBxTjBaTDZ3?=
 =?utf-8?B?ZG43ZW14SStEUzNBZFRHRnh0YjJwbHZIMC90WVgxNWk1aVk4cXBRNHpxUlpM?=
 =?utf-8?B?cW45cFQyR05KUnB5QmMrSmljOXJBallsQ3BOdU5IVDE3UkMzVVBFcnRwOWVh?=
 =?utf-8?B?ak5sVkp0eEJVQ0k4bkhma1Z1bHBtYjJKODNtSFdCVXZGSVk4bzZESVc3NUo1?=
 =?utf-8?B?K3VZTGYvVnJFY1BUQkMrd1NvbEhRTUF0NVNuVWlSVUwram9kSmJvQ2JyWW1V?=
 =?utf-8?B?Q1FqeFAyNEg1Uys3T05pai9GUFJUT0Z4SzMwa1pwcGpob1lHSjIvajN6dVZP?=
 =?utf-8?B?WjBrRDI2NGlJbHdWTnYyWXo4YitTYU54UzBpMVQ1QUZiZ1RrUGV0UVBwTzM3?=
 =?utf-8?B?QTY1WHcwUzJtekU1ZGxvOHNRZFBCNFJPc0RKRFlHUHBtMjNBbW03dHFBMk9r?=
 =?utf-8?B?bkMxWnlGM1BXaC8rMDNXKzMwczNXZzl6emswSFZMWTRBN0I0enVoT21Kb1Zi?=
 =?utf-8?B?Yk9reGRta3h0a2sva3pvUzJ5Wk5oTmRlTVRiUFBwKy95Z2FOdmNxdUxieUZw?=
 =?utf-8?B?dW1PY2xjRWVMVkVBb2prVkVoVEVVemszNGVtRks3WDBrMEVhMnVxZFBqZnVz?=
 =?utf-8?B?dEJQTU0xNUZmdWZGTXZCT2ZST3B0RkNpZEFsSWxpek5WV2ZnRFUvTVFxOEh4?=
 =?utf-8?B?Rm4yOTdQVGZDK1FvNDlnS0JQY0xaYmttc25BS3NIY3hId0ZXc05YWWx0WHNx?=
 =?utf-8?B?QmgrdDA2UmtLc01QZ25aR3RKSHVFWjlBSHVxUTZzTzFFa1l1aTgwQzh0MWdM?=
 =?utf-8?B?bmFGMlJGbUk3RHQzY0lSVlRNanpHYlVkTDZnOW43V3k3cU1ndWtkSTRRMDNJ?=
 =?utf-8?B?TUxKM2E0MlkvdTZpNUZHWEtSeTdqOXdLM1plRk1HdVhHdzNyRFRTa3NCdjFB?=
 =?utf-8?B?NnVLY3ZmYy9WUXI0ZzREWmhVRE52M0tBVWdkNnNJMVNrV0Rkb2NqWUN1dE95?=
 =?utf-8?B?QkpqMjI4ZEtHd1R1aHhRWXRhWlhzbE90T0RqcEJHVytMTWlSbmNkaFVvdFhp?=
 =?utf-8?B?Nlo2STAzZVFNbG5MUHlLU0k5SWhwZC9YUFl1WjArd2c0TUtzWGdoMUp5Snly?=
 =?utf-8?B?UXkrZ3pnNjZIL0VTY292VXpOR1d3cnNndUtMTTEyeWl3OWRYUERTNFp3eVI4?=
 =?utf-8?B?NXNTYmhMekNicC80K2NwS0UvekF4Q1JJNDVZMkowb3lsYkN6QkRSMzJVUWxE?=
 =?utf-8?B?Z1FmeXEyTlpnYVVNYXp6YkRwN2FlTUsyWmtyY3B6SUR4cTdsMnpFWW5UL1RS?=
 =?utf-8?B?aGJGNUZ0ZWdCZ1BXb2RSVHhKWEtrUWpzTnR5ZEpKVFZvK3BBVFNaaXlYdHA2?=
 =?utf-8?B?bllMWmxBK2Z6VFArNkhTOUM1dUFGNnEybXh0N09uZUhrajZJZS9DMmpQUmpU?=
 =?utf-8?B?b1dYT3QreHI5dWt5dG1iZ0JjV2Y1eC9lSUVWeFZBQ0NFVkFuR2VMV0xOMEJG?=
 =?utf-8?B?NTkwWjBHTEJUbS9jQ3ZQWnNLb3NKdndsUnRsNHM2OG9CL1VuZDBxVnZtMFZv?=
 =?utf-8?B?SDd0NGRyTytlY09yUDlpejRvRXc2TDRWVTBoazV2TWFTczF1MlVyTVpkR0ll?=
 =?utf-8?B?WVVreE5IMkU5UUlkeHBHd3dMc1VyRUVyMjZsdmlObnRIbldXYktBaTN2SXd1?=
 =?utf-8?B?Z09lamFVTWVDa1RhN3NTN1FiSmp6OG43N3lVSmdhMjJuQUliUTYxWEo0RWcx?=
 =?utf-8?B?MU9GQjlvVU1OQituWUpzKzhLbk8vZ3lKNDRHUGFGOThGYmxVMEpJd1luODNL?=
 =?utf-8?Q?KPw323p4D7GNdZII=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c808bed4-9ccc-470b-2a3b-08de415b5f5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:09:43.6266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EWRflzo14f6dDtI1a4YHUrLv8vUt6CVV9X+VpdukoIPSzWFiIl8vqE/4TNx+hJECJ8KLvV0bvhSFJyvpBJEI80QyaOi+NIPft5dmkWK1mY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6967
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


On 9/6/2025 2:38 AM, Swati Sharma wrote:
> Add test cases where we are validating force dsc and force
> joiner.
>
> v2: -fix if() for ultra/big joiner (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc.c | 198 +++++++++++++++++++++++++++---------------
>   1 file changed, 126 insertions(+), 72 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 7f0745370..5720167a4 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -55,7 +55,27 @@
>    * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
>    * @fractional-bpp:               DSC with fractional bpp with default parameters
>    * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> - */
> + *
> + * SUBTEST: dsc-%s-%s
> + * Description: Tests Display Stream Compression functionality if supported by a
> + *              connector by forcing %arg[1] and %arg[2] on all connectors that support it
> + *
> + * arg[1]:
> + *
> + * @basic:                        DSC with default parameters
> + * @with-bpc:                     DSC with certain input BPC for the connector
> + * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
> + * @with-formats:                 DSC with default parameters and creating fb with diff formats
> + * @with-output-formats:          DSC with output formats
> + * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
> + * @fractional-bpp:               DSC with fractional bpp with default parameters
> + * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> + *
> + * arg[2]:
> + *
> + * @bigjoiner:			  big joiner
> + * @ultrajoiner:		  ultra joiner
> +*/
>   
>   IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
> @@ -81,11 +101,13 @@ typedef struct {
>   	int disp_ver;
>   	enum pipe pipe;
>   	bool limited;
> +	int joined_pipes;

enum joined_pipes force_joined_pipes would be better IMO.


>   } data_t;
>   
>   static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
>   static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
>   static uint32_t bpc_list[] = {8, 10, 12};
> +static int joiner_tests[] = {JOINED_PIPES_DEFAULT, JOINED_PIPES_BIG_JOINER, JOINED_PIPES_ULTRA_JOINER};
>   
>   static inline void manual(const char *expected)
>   {
> @@ -135,6 +157,7 @@ static void update_display(data_t *data, uint32_t test_type)
>   	int current_bpc = 0;
>   	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
> +	bool status;
>   	igt_output_t *output = data->output;
>   	igt_display_t *display = &data->display;
>   	drmModeConnector *connector = output->config.connector;
> @@ -147,6 +170,11 @@ static void update_display(data_t *data, uint32_t test_type)
>   	save_force_dsc_en(data->drm_fd, data->output);
>   	force_dsc_enable(data->drm_fd, data->output);
>   
> +	if (data->joined_pipes == JOINED_PIPES_BIG_JOINER || data->joined_pipes == JOINED_PIPES_ULTRA_JOINER) {
> +		status = kmstest_force_connector_joiner(data->drm_fd, connector, data->joined_pipes);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +	}
> +
>   	if (test_type & TEST_DSC_BPC) {
>   		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
>   		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
> @@ -246,17 +274,22 @@ reset:
>   
>   static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		     unsigned int plane_format,
> -		     enum dsc_output_format output_format)
> +		     enum dsc_output_format output_format,
> +		     int joined_pipes)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   	enum pipe pipe;
> +	int n_pipes = 0;
>   	char name[3][LEN] = {
>   				{0},
>   				{0},
>   				{0},
>   			    };
>   
> +	for_each_pipe(display, pipe)
> +		n_pipes++;
> +
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
> @@ -265,6 +298,7 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		data->input_bpc = bpc;
>   		data->output = output;
>   		data->pipe = pipe;
> +		data->joined_pipes = joined_pipes;
>   
>   		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
>   		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
> @@ -285,6 +319,22 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   						      data->drm_fd, data->output)))
>   			continue;
>   
> +		/*
> +		 * Skip invalid starting pipes:
> +		 * - Bigjoiner needs 2 consecutive pipes : skip last pipe (n_pipes - 1)
> +		 * - Ultrajoiner needs 4 consecutive pipes : skip last 3 pipes (data->pipe > n_pipes - 4)
> +		 */
> +		if ((joined_pipes == JOINED_PIPES_BIG_JOINER &&
> +		    (data->pipe == n_pipes - 1 ||
> +		     !check_dsc_joiner_constraints(data->drm_fd, data->output,
> +						   n_pipes, joined_pipes))) ||
> +		    (joined_pipes == JOINED_PIPES_ULTRA_JOINER &&
> +		    (data->pipe > n_pipes - 4 ||
> +		     !check_dsc_joiner_constraints(data->drm_fd, data->output,
> +						   n_pipes, joined_pipes)))) {



if (!check_dsc_joiner_constraints() ||

(joined_pipes == JOINED_PIPES_BIG_JOINER && data->pipe == n_pipes -1) ||

(joined_pipes == JOINED_PIPES_ULTRA_JOINER && data->pipe > n_pipes -4))

continue;

Here we need to take care of holes in between. Its possible that some 
pipes are fused.

We have a solution in kms_joiner test, but that might itself need a 
change as "pipe" starts referring to userspace crtc and not the "HW pipe".

For now a fix me should be alright I guess.


Regards,

Ankit


> +			continue;
> +		}
> +
>   		if (test_type & TEST_DSC_OUTPUT_FORMAT)
>   			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
>   		if (test_type & TEST_DSC_FORMAT)
> @@ -334,85 +384,89 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
>   	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters");
> -	igt_subtest_with_dynamic("dsc-basic")
> -			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters and creating fb with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> -			test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> -				 format_list[k], DSC_FORMAT_RGB);
> -	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -	}
> +	for (int i = 0; i < ARRAY_SIZE(joiner_tests) ; i++) {
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with default parameters");
> +		igt_subtest_with_dynamic_f("dsc-basic%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +				test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> -				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> -				bpc_list[j], format_list[k],
> -				DSC_FORMAT_RGB);
> -			}
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with default parameters and creating fb with diff formats");
> +		igt_subtest_with_dynamic_f("dsc-with-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> +				test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> +					 format_list[k], DSC_FORMAT_RGB, joiner_tests[i]);
>   		}
> -	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it");
> -	igt_subtest_with_dynamic("dsc-with-output-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> -			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888,
> -				 output_format_list[k]);
> -	}
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with certain input BPC for the connector");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with certain input BPC for the connector with diff formats");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
>   			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> -					 bpc_list[j], DRM_FORMAT_XRGB8888,
> -					 output_format_list[k]);
> +				for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> +					test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> +					bpc_list[j], format_list[k],
> +					DSC_FORMAT_RGB, joiner_tests[i]);
> +				}
>   			}
>   		}
> -	}
>   
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with default parameter. While finding the optimum compressed bpp, driver will "
> -		     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> -		     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp")
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
> -				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with certain input BPC for the connector.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> -				 bpc_list[j], DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC and output format on all connectors "
> +			     "that support it");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> +				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> +					 DRM_FORMAT_XRGB8888,
> +					 output_format_list[k], joiner_tests[i]);
> +		}
> +
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC and output format on all connectors "
> +			     "that support it with certain input BPC for the connector");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +				for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> +					test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> +						 bpc_list[j], DRM_FORMAT_XRGB8888,
> +						 output_format_list[k], joiner_tests[i]);
> +				}
> +			}
> +		}
> +
> +		igt_describe("Tests fractional compressed bpp functionality if supported "
> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
> +			     "with default parameter. While finding the optimum compressed bpp, driver will "
> +			     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> +			     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp%s", igt_get_joined_pipes_name(joiner_tests[i]))
> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
> +					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +
> +		igt_describe("Tests fractional compressed bpp functionality if supported "
> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
> +			     "with certain input BPC for the connector.");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> +					 bpc_list[j], DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +			}
>   	}
>   
>   	igt_fixture {
