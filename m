Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23431D58CBE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 02:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FE910E2CF;
	Mon, 23 Mar 2026 02:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFznCb8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1951310E2CF
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 02:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774234690; x=1805770690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H7HtHrUloLp8QkeK7BB5WRaE37P7o2NoqrApNctEP4Q=;
 b=iFznCb8tQlPvvWRwXPyJ0SsdLRTXRHwofkYL/fMHDcKHRvLtmxyAYqHJ
 fSnG04Y+vZyXJmBSz9n6LyvkESAVBC7mOkA2leeQoLiUgF902kJQq9/Kj
 Hj5SA8Sb5sVZZrxpVTvpmAap+tZ/MYa3t2egRhjJaP1sveywUspze/we0
 pEAqAnmpuLSlH8iyJr8AqvJ2/rmhpw4/0HAwa2ycBFELcYg3r3cCR32xX
 XNaw1R/BBr707EhO8788NeupdOHgPbApVcmM2c46vbI82UeNZFN0ZbCJ8
 8DTQ0c0FVhxnU+odQwkAoqvukLwf4pP1l4L6BMqaQ+/oiBv36IuTuzaZi Q==;
X-CSE-ConnectionGUID: cvc8YwXQTIqJ3lREvy/rlQ==
X-CSE-MsgGUID: nD9g9UZvSDq/8hpLmAnh6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75257142"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75257142"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 19:58:10 -0700
X-CSE-ConnectionGUID: Tms9iS/oR0y53KXQcxkc+A==
X-CSE-MsgGUID: +Lh6LYwPRdWcVhx3/T9AQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="219109414"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 19:58:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 19:58:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 19:58:08 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 19:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1bgEsOWoGFy526Oz/RoLI3k+8HYlyTQIxQHRUGI3mt6UukpJXU3WhT55ddCLjuyRkXyiPAE8QpmtIPePTY1jGG5LWICE+Dhty29at89VmXfOgU9SKan9KAMobK6D92dRhaSKtxFl/jN4E6j/LEdfhLUXerq08m4v1IPbL8NCm2rtES1n6hQRJgjhdZU9/Ne2pzF8s19/3q1QjBWLjXfTvU+4eWO/VYWIrmJSL2LmZ7ZtAStE48GO9r9w4xVBKktMZAH1aT4havT4Yh5akde3Wu//ZRZa1H7KZ8+sDgsj0o7s/Cj1wC/dQm5VG5PkF8i+RvKvYiL8pViZToCUhymEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VYbymSt3LlsZFsaL64kgYwrzDfcHDBvXr/QSZGcdrs=;
 b=jMAJ0Cqx7Z7JVYCOv1NmcerZ6LCkq743reuMmwRYz90rb2ZH9IabXTF70fdp6+XvbdSX5r8++qhAQ5OOlJzRpQbC+zkjJmE+3GuG0cZIln/lYyhNOAI/EjQyp6rAEyj2pMW/BKRFqE36ApzkyapTETYUx3zNcNbUhynVuLHT0ojb3AVWlkmMPNkFgVbiQeOGzRWQVn2vaYGWb1XSqUAk7pAH0zndEShmQQ21wVkMaBNlIRQjMP7jmsflB4fiCN34Qt6KiqaUAilaJB4UVDyrtlt0NB2oJ0Y2JH47tPTbtyx88EY6MHpO5jFSvNSzPvL5r8A6x1kPOm13LLONo2roOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH3PPF7708D4D9D.namprd11.prod.outlook.com (2603:10b6:518:1::d31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Mon, 23 Mar
 2026 02:58:06 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 02:58:05 +0000
Message-ID: <61f8c098-ebe6-4c3f-a1d3-e2f2389c1415@intel.com>
Date: Mon, 23 Mar 2026 08:27:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/2] tests/kms_content_protection: Handle EDID
 lookup failures
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
 <20260319064115.72836-1-santhosh.reddy.guddati@intel.com>
 <20260319064115.72836-3-santhosh.reddy.guddati@intel.com>
 <DM3PPF208195D8DAC222A0188D2D82DE353E34FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <DM3PPF208195D8DAC222A0188D2D82DE353E34FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::8) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH3PPF7708D4D9D:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d220768-3b54-4299-070e-08de8888017c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: etK6PetGdWVp44d52JeS52Fq+c6doIqgT3mN84EXynlHRhTBO8/3ZZyONmTqdU35R95Y9icdWLPxEkD57Od551yjL9Jm1E7oXZI0kEOEuLpAcojkXA0cFLdHWwuPO28Bn0Ti0RAQW0sF4ZLHj0lrQqrEUKQ5DDAaoQk6BUlDykVZm3UQbSmydzMz5vQmvqWLDNPhFp3YBincqRPuv1svnuaT3m4sWrEBkfE73HTEi/x2FpopplGOV0QV5E5KzjUhrkYz7smQtdPIJZBD/j6af1x1p49BBL03wv14dXK2bckLMIboYmCLgGQAdFBcTTz69LlZGVJZJKdArTHB4dk+++5rHeX7d37QX332LOCtYhn13Y85I+BhJ4CQ5figZtTzNrQvuQ2TsyX0aizSQkqezXECrT12uLUdATvBENYFEFfH7ZIuXc8dh1t2f6f9AVoilD5VIqEQ9K2qJwatJGWnVA+UZCgtYkP+xHm23cvx3aN+1JZoPZBgaC3GjTQnHYtdiBeXnCgOgxuakTexwlBbFAzdRFwcca99egNWQKsKLcTCP/kFBH37AOCCfd95ox7k9YDUjsEfROGMcL13xSwXzm07tlf6kc962k3/JuCe8Iyi2whgqqCdn7ei6O/ndj1ZKiTuoBhhAWDTyFhxke0ixUz5oswizuTc3kpjObiOfY8KcMfJxflVhb0chSvXqdB7Jbsw+McFc5i4WkFrm/do29TcWXomj/DoFMQiWMZD14E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU9QMThweTh4TXdHY3BTbk1UTGt6OUFxRzl6Qm9XYS9wY21BUDFHcWlJZ2FS?=
 =?utf-8?B?Tko4cUlVeUJkRWZWTUtGS2p4SU9xTU4vci82ak1abEdJckkwZDAvOHU4Um0v?=
 =?utf-8?B?UDVrQjNIdXRmU1JHVDNXVExTY2F4UFhIbUFWdFNucDJGY0FISzNNZXhaWDNi?=
 =?utf-8?B?RjNic2R2U0VoVkRtWkVYWU9YR1pyUFFjVFNkYVJUaWFnUmFIRnN3RGJTaFlM?=
 =?utf-8?B?L0dxbzhqS2p0K1RqQndaNi91ODJrYk1LeG8zQkNvU01iOGZHdjg5WTZKcitG?=
 =?utf-8?B?YXZ5MjFWRjY0Y2VYWXY4TjJKdHBoREtTcmNFaldnWWpLL2J5QkpYMXlWZ0to?=
 =?utf-8?B?SmRTTWdqQldUWWxOMGJMSlZNaGJiY0VXMjJhTnA3VnM2NEkyUjN2aUZCOHlz?=
 =?utf-8?B?K3lsS1c1S1UrRnBxeGsxM0wwRGVvQTNUVTlGWnFrdWl2b0RBb1pxTXhUeFpJ?=
 =?utf-8?B?Zm9IRE9xbFRrZFg4M1RMQ0dPWmY2SDh3REFUeCttTkRkUVkxemlhZEYwdVBn?=
 =?utf-8?B?TFRBSHB3bGZGNlZKalBWbVdnVnVJeEVubmJwc3Z5MFFoc1oxZEtqRU1rRUVK?=
 =?utf-8?B?Y1RWQjNPaWhGVEQrbHhhQWNQdzh4MmZEbXV1WjNMNEFLYS9TYUI0V093aURz?=
 =?utf-8?B?RTJKMmIzYVNEbVZIMndaNWxyRlZ4SjlhbkFxTDI3a3JJMjdDKzFqZUs2RTJH?=
 =?utf-8?B?bnJUd3ZUWnN0YUgvM1ZTc1h2SzNkMndzbkNFNkNuSWlMWHJMcGF2Tk9KS0xL?=
 =?utf-8?B?dUtyU3NnZkJmNnR6UFcwYm05NENibGkxWVpnSXVZSm5vYWwxRm9jRG8yd3ht?=
 =?utf-8?B?Ujl1ZGtGQnMvYjVpQTlYaXFNZzgySWJLaHd5WW82bmQxV3dVcTJXVnhhU0JT?=
 =?utf-8?B?L0lCTkV3NWp4MUIrMklsOWFqaGtaTmt0QTJGS0gxR3ZVNWZoVmYvV1BOZmJZ?=
 =?utf-8?B?MFRKVFVkRWhzaWdER3J2VDA1SE95UHgzV1VnS0FWbEdEUE85b3BVZVFaQzE4?=
 =?utf-8?B?MnZOVlFHMlgvQUdNSmQ1S0pkbnRWK2tLMm9QcE8xcnZlcys4UEdGUWxWMk1p?=
 =?utf-8?B?M3BPQTNCcUF2STlWUGRhWHoxYlZaWVlQOW5RUllIdjhxS2p4V1VFcXE0YWZ4?=
 =?utf-8?B?Q1ZYK09paVVlcklGeHdwTHBoMmpWcnNKcTJNV0NpSmpxWDdPbUZkTUpnblFQ?=
 =?utf-8?B?T3NONER5M3pIcVlCTUNUbXRVSnpzTzNGbnkrNHlqOEh2dU9nOGtzdURyOGVJ?=
 =?utf-8?B?cTBRNmN4VVUybVpxUGJLSG9RUkg4dWZCcVhMU0hLTG5CYVVQWnpNcW1lN3o1?=
 =?utf-8?B?UE1HdG0yTEc5YXh0TFpJZ1lDTW93NjFsbHdqc1BySE5odWRDSXNhSlFnYjBz?=
 =?utf-8?B?YXVJbjRqVXJJZ3VZSUFLbVI5czM3bzRaWDNxK2t0dXVaTHVkQzdZQ0lOQzE5?=
 =?utf-8?B?MFFkN2NBNTBwcHZHZ3c2RURhaDQzMSs1akhiNm8zdGxOUEd2MENTOFV1STB3?=
 =?utf-8?B?SjlWd2g0bkxkMzlnbEhXMTBEZ0g3WStBZGJPdXF4eEdEYklSNnowemRoOWVn?=
 =?utf-8?B?dDdVK1FldmFLZENNWmFQZUErQ2J3bW00a3BsRngrK25NYWZPZnBwWHQzWG50?=
 =?utf-8?B?VzBNVGdNRjZTUkFKemhLQUxJVGlPUGY4TWdOdy9jWG1aZTNKVDFiVmFYdlda?=
 =?utf-8?B?dXlBcFFxN2tCZnVoTkhkSHNMdU82cmlkTXllZnBlUjBCc2ZoWGdCMUI2VEdu?=
 =?utf-8?B?RTYyVFFNQTNTTGdGalo5UkQwZldBVldnZERoT29wSXlEWTVEQTJPdHVnbTZO?=
 =?utf-8?B?LzJnV0ZZRGlPTWNkcm1ndmJ4UDh0Q3hTQitKalphYm42aENGZVVzdGxlZnIz?=
 =?utf-8?B?L3U2MkVGbFo4aGx1ZjhOWEJpcU9aM0NsRmVLVVRkTU1MRkt4Zm5Va3UyRWVP?=
 =?utf-8?B?ZUw1NHNHNUd1Z0ptQy9tdlJzN0VWOXNQYlhZdnBQZUF3T3FEOHR1NGpvZW9U?=
 =?utf-8?B?bGkyRktkdVFhQWRKT1lFMXd3QlVCZFA4ZVhFdy84T0dHWW1ZTGp6c2U3ZEdo?=
 =?utf-8?B?cmdQT1RPR0tpSzRtem4zNU9HT1lyU1gxcmpMaUE2WDZOUHZpSjdXZ1kydGJY?=
 =?utf-8?B?bTNUWjVILzRQenZyNU5YMitDd3p0RzNwSVJCekFHWjlQTjQrSkdEZ2tNbE9j?=
 =?utf-8?B?UjF4SnVGR1oxbXJDZy9lWnNOS3RaSTIxSVczbkV4bHVJOW9obURsSlhwVEJw?=
 =?utf-8?B?bDhHVDdWd1V3QnlKeTlIMGM4TUE5TWg0VGxvRS9HMkNKbExHMVJjM2U1cXpy?=
 =?utf-8?B?RCtONUw5aDlOWHIwdUZvanVLNi81UkNuaFRlUzBMRTV0OWhoZHFEbXBBeW90?=
 =?utf-8?Q?m9G82bAkCqwg8rvdr8i1O0hhBNteiILNJSLe0?=
X-Exchange-RoutingPolicyChecked: TczspSQO8bVouy30fRgaZUFLiMmC/IqXrGZmh3arqMJd/b0ceN3OJtaTkR9FuxCaiVadp1Cnd/KNoBR6WtoAzBoCGx11SwHnFDpMWxBIOc3Lijb+gdxuykjfWgOQ1yXK0t/UZDaUUb3aUaZJxBhsguS1HzyfWSGFIHKStjRryX/iHqvqnatEPH2Tu9v/SmOVpZRmqg7qPx4zoX52FCfGaD8JtmlJ3y9TuUvylS+lnspCCCcB/FaSAUPrOd9K+uYyK8y5hzeeMnb1uiCmhO05RmH6qVWThe/lsUlgFl1uhbOTHWLwHn4R5HR1g1T+Uk6NBcPNBZ83yjqD41zy6OZWlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d220768-3b54-4299-070e-08de8888017c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 02:58:05.9270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQf8FZg8A92IZyhXY5IeUHTp1g+anQy6iQ3FrfvZD6P7qrI/06HaQKIr0hM8JG31rjDx0AE6RBalHEU78csPsok17S2nDp7qBjPpvrEKVzwOfLoaoUf78wUoj2TNwLnR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7708D4D9D
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

Hi Suraj,

On 19-03-2026 16:20, Kandpal, Suraj wrote:
>> Subject: [PATCH i-g-t v5 2/2] tests/kms_content_protection: Handle EDID
>> lookup failures
>>
>> During output selection, connectors may disconnect or AUX reads may
>> timeout. In that cases, EDID blob read fails instead of assert log the failure so
>> test dont asserts.
> 
> Does not make sense to have sudden connectors disconnection when you are just reading EDID.
> The only time this happens is you are trying to ready when Connector does not have a CRTC.
> Needs to be investigated more.
> I suggest you do not add this to the current patch otherwise this will hold up the previous patch
> 
Thanks for the feedback. Agreed, I will drop this from the current patch 
and will create a new patch for the EDID lookup failures upon 
disconnection with example scenarios after investigation.

Regards,
Santhosh

> Regards,
> Suraj Kandpal
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_content_protection.c | 24 +++++++++++++++++-------
>>   1 file changed, 17 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
>> index caf3d7a56..006aeb510 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -683,13 +683,24 @@ static bool
>> is_output_hdcp_test_exempt(igt_output_t *output)
>>   	const struct edid *edid;
>>   	char edid_vendor[4];
>>   	char sink_name[20];
>> +	bool ok;
>> +
>> +	ok = kmstest_get_property(data.drm_fd,
>> +				  output->config.connector->connector_id,
>> +				  DRM_MODE_OBJECT_CONNECTOR, "EDID",
>> NULL,
>> +				  &edid_blob_id, NULL);
>> +	if (!ok || !edid_blob_id) {
>> +		igt_debug("Unable to get EDID blob id for %s\n",
>> +			  output->name);
>> +		return false;
>> +	}
>>
>> -	igt_assert(kmstest_get_property(data.drm_fd,
>> -					output->config.connector-
>>> connector_id,
>> -					DRM_MODE_OBJECT_CONNECTOR,
>> "EDID", NULL,
>> -					&edid_blob_id, NULL));
>> -
>> -	igt_assert(edid_blob = drmModeGetPropertyBlob(data.drm_fd,
>> edid_blob_id));
>> +	edid_blob = drmModeGetPropertyBlob(data.drm_fd, edid_blob_id);
>> +	if (!edid_blob) {
>> +		igt_debug("Unable to fetch EDID blob for %s (blob id=%"
>> PRIu64 ")\n",
>> +			  output->name, edid_blob_id);
>> +		return false;
>> +	}
>>
>>   	edid = (const struct edid *)edid_blob->data;
>>   	edid_get_mfg(edid, edid_vendor);
>> @@ -724,7 +735,6 @@ static int get_hdcp_outputs(igt_display_t *display, int
>> content_type,
>>   			continue;
>>   		}
>>
>> -
>>   		if (count < MAX_HDCP_OUTPUTS)
>>   			hdcp_outputs[count++] = output;
>>   	}
>> --
>> 2.34.1
> 

