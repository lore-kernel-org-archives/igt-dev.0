Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F0EDB7CA
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 08:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7044810E362;
	Tue,  7 Apr 2026 08:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vm2IHts2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7369C10E362
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775549862; x=1807085862;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l3Y9OW75MjqNDv1xWLhC2d8IMKR80OnHlHD83ggfq6I=;
 b=Vm2IHts2ViiFV/p7c2S+VL/rcBvYjAktqAXIBiDjDARcrUC1/KHcJdGI
 nusRIrH33+LwbwFiNkZX1h0x9boWHzGtkjt/ZOcDTJE6lZ151OBANWFqv
 0KXhm4vxyGsujgkEwTVNhG2w8i9RtnqyDg6q28SJLtoQNQa5g0uZrczHN
 NCwmDdw92r0iyu2TpejRzZ0kGr4GbntkcbsP+L5MhP1HG63kfsbTUiRuK
 5wKMFaDwFPq+w3r8lC+yn/vOWzPwzVfQMYj3ykG+lElJJjTZ1UWKUYYOF
 zyJbbbXBe81g+g3LEQeJKyTgmM0xds1GkfLAZruWD3bmuEV9qZGjurt/l A==;
X-CSE-ConnectionGUID: N5j/pi7fTTuzPyPSU/5aQQ==
X-CSE-MsgGUID: KACLtblxSZKHBVAaIELkuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87958061"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87958061"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 01:17:41 -0700
X-CSE-ConnectionGUID: EM96vLBcQDqWFx4niwIbgg==
X-CSE-MsgGUID: uC68x1tJS2md22qBubM6Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="251397312"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 01:17:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 01:17:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 01:17:40 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 01:17:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zkr1DgBypOnDILmYB5KKDGeu1izl6DCERX0ktyV4Fu2IWeu9i+KYgZvahBYa0k+uUyJ4MXJqqSDfkl2sozbLlF9nByLvLThsGl4nzztfh0nLu7UNtnZhEai2c6Om4RAmfRx7eiP/QhXjax56P/Y0B4nDAF9+JVVgTYjxL6hOosEt8q1Qm8gPS874H2Y/zH7bcAr7TC6LcwxSSE7FoOOhgCh3FtmEtnRCR0VDwEbGvpk+uwlSFphEffHo5klVskTYhn1/zuy9wczP4IKldOoWD/itSC1d4qccw4DtSCiD7AV4v8umCgmvQYt1zliT6TQYk2JCPEAQDzBVCLoxK1fYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXPHNwV6qm1LQMj3OzSpHc8/TaAbw73SibAh8KSyUQ0=;
 b=dV3Nw+gITmHJzpfQo9/SiJZTT8LrqLh6QIb+MOz+MBWpNd27x6Zc3ZNvO4vInlnlhjY91LrFg5hiO8y+KUYpjoC0jzZ6UQErEiT7sR+lsGYAKCbuUPLIGQeKnw3rlaLZFC9B6ywIE6VKyzXEvWCetsE/G7UYxztsPGl31x529U1smCu4qzNu+SwSxTH76Bj7xVoX8AXnJjCdmUo1W28W2dg9WyHoCtz/pwhRlu5YhLl0QMBELUwTEsOaj4Bn8MdSlV0hxYy7w+Rd+ZflVK4cXU+QZ1hfsBudnZfUNwYyaN4cn3aCHmJqXIXn6u15Oje6jMyOARJOU0AUjuBGurNa+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM3PPF291EF9BF1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.38; Tue, 7 Apr
 2026 08:17:36 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9769.017; Tue, 7 Apr 2026
 08:17:35 +0000
Message-ID: <c8eb555a-e7b5-49c6-a42d-a1602a39380c@intel.com>
Date: Tue, 7 Apr 2026 13:47:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_pm_backlight: Setup output
 before reading writing backlight
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260331073400.1316874-1-suraj.kandpal@intel.com>
 <20260407054302.1454584-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260407054302.1454584-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM3PPF291EF9BF1:EE_
X-MS-Office365-Filtering-Correlation-Id: 0872ff6a-dc3a-4a3c-f804-08de947e1fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|42112799006|22082099003|18002099003|56012099003|20052099010;
X-Microsoft-Antispam-Message-Info: Py/C97wExEeYWXW4AJ1nWG1kjhAzT0oRGLzC+9jgLywU2PomKZzLWD/BRYM626r5vHFQgqzRA4WRinoRcWkbxRzjxmRUF6H9yx+W6V73aLIwnmD3LKvLQfK4zbPuYwt1+LYRgMNWBg/p98qAc5lzC5ReKkCt9OU5Qc143R74grAG7yeBoj8/iJg/0mm79M6cLkG1ErF399Hd+/hpGnM6NN3942B9u5h/aDt8fyqfIcHO08H3QAkNhOzeNAMn3tdufu9YjGtikAJGGQ5nv1tpvZqKtoK0ZbGxENHyAfvkbb0IluCBTk68T2DimqCHyfqXledH+OBbCQAe9oTx5KOf0KusJ0KzhB2+DsqvwNGNkhvkAvltux4WLKv42fV+nzVt9dp9y+8Djr989t6jWy55CZs6XPXepcshKUKUey4kEUT+lZRCpZuRMFuSxA3UiBPOGF3S2magUrNZqzd1QtfpThHuwlgxXBhjzYZtaKcTKFuu4s/+ZdO3O57kk2U+tHduwnxRUS6MEzQsLrGw0OjFw/sXqTKOSOgAXHj9HbAl8n3JtIr1luTpMX3yx3XUt6tnOhxvODWRx5TKFhorOHq5LaSli0ABFy2UwWJMFO3++mic+pYlWHTs6wDPPOfEpQZIt1UQ5Wh5X3XVx8Ar8klgb716aLPA8GMCg1VSkZxSMQxhLOCSBC84fZphsXPRCEO6QxlI2UhqKkWRiN9K2k2y2e7TzlURsqsAcVZInlK7tUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(22082099003)(18002099003)(56012099003)(20052099010);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVZpVnZQRGU2alNOem8zSkkvNmdaVlc1bEMxczcrNWxPVmV2TVk1ZUU5OTVM?=
 =?utf-8?B?SXlJQ3E3VnFZWkdGMERyNVB6UnhkdTd2c0R4eGVyazE1WmFraFZEd053NWJK?=
 =?utf-8?B?a1ByL1ErMG5YbCtaclZENUZMeFE3RW03RFJRVVRLNGplS1M4eFJMQ3BmalVL?=
 =?utf-8?B?UG5EVEtFZWZPR3Z5NHRGZVBBaEpIRXlWbEFYYUYzeDZZS1hLYWN2NEpXVUY0?=
 =?utf-8?B?SXhaelZxTFU3V0JOZEo5bmNBTSsrYXBCSmtEd3RQN25wakVKaUZvRytOZ2tT?=
 =?utf-8?B?M3VqenJ0YUFEcFR2Z0o3WGozY2NJekprZ2JXWEJ5bWFXbUVvaFpaR0ZMMW1X?=
 =?utf-8?B?ZFFBOFh1WXUyNnoyVWRjUVE3bHpPSDVvOVR3K213bGpvUVNqcmI1UkdUOVlm?=
 =?utf-8?B?bk9DV3ZXRTJadm5xc0hyRm5saDRDTjBlajRyb0NPR2JnMlp0NW5TaE1yaFNI?=
 =?utf-8?B?ZU8rblE1Qkl0SnhzZHg5aGpCNlZQZWlxaGtnNzRnZklXSjBVYUVaNitqd3pi?=
 =?utf-8?B?WHBmU2xqQkVtaXdUL0pQMGJ2dnpMaFlLc0hJQXE4VGN2YVFoTDVlYkJSdEZ3?=
 =?utf-8?B?U0I1bUdaME5zMHVZR1BTN1g0dHM3TW82b1U3UmplZStoOXpMZG5oeitidFFB?=
 =?utf-8?B?TW9rLzBEREhaRm9YOUdXclI2VlJyZ3BGSHg1S3ExTVArZTk5ZGc0OVk1QUxL?=
 =?utf-8?B?K01XSlE4VW91NTlWR1RFU0UwckIxT1dpNUNLVVpyS1A1R3JSWlVJWWpyd29s?=
 =?utf-8?B?OE42ODFZY0QzMGR4SDlSZW1RWXhSTjhzUU1WS01QbGZUejFmamtTOEdLTFdv?=
 =?utf-8?B?Y2d5Y0JNSVBCaG5UdzVLTXI4dmZkS3ZtaTF6Z1NleEFsdTl6cDNNVzhqaUpF?=
 =?utf-8?B?Z2N4bTBwSlV4dnRiQ2k4dEZTaDdQNi9OaTMxOGVjc04vNVMvdEI5VmJYcnVI?=
 =?utf-8?B?QlVzSHIxK1VQS0F3ZG5ocVVweXNzK1AzK0dGcXR6dWRnTGxnQWphNkVkLzln?=
 =?utf-8?B?MEFOTWkwckFTY0F3bDBFOGN1U1NjUzh6OVg5ZFhVeGtucXp0bVFFYVNIbzFp?=
 =?utf-8?B?Z3NEYUxkNW5GUEdKWk8vajVZalE5WUpBaHNWQnZHWXgxL0FKVEFFZE4ycWZO?=
 =?utf-8?B?M2U2b2draThjRUl6dXRqUmc0NEp1b09OM3NhT1NLamgzbGlZUDdkTkxJelhC?=
 =?utf-8?B?b09UaEl3eDFKMnFuQll4UEZQUWNNUXh5bG54eG01U3JPUWpWNStIdEFZUFhs?=
 =?utf-8?B?NHJLdHRvNkRjY3IvdEhKT3NVbHlVU3ZjblZ2M01mVncwNkVCc0tqNTZnc0hD?=
 =?utf-8?B?dzc0MkJuQ28xQ0I0ckZVaDRobXBpaXlsNm56ampOc0RjbUZROHZnaDBialgv?=
 =?utf-8?B?dlJYanRON0pYMWZzRVpBWFJqVFNWNnE3WmNCK3JmUnZBZ3NZc0w1MzdsU1Fv?=
 =?utf-8?B?L1NETTE4c2w1Rm42OUZuOVNsYnRteGdEVWpsUzFEK3ZTTDA3dnYxNTNITTVq?=
 =?utf-8?B?YzR2LytaZERUZjRpb0lPNUJBUVp4TWx3dkRNR01LdkNienNyQXJZMUpMS1Zh?=
 =?utf-8?B?b2J3ZjF1akVmeVdHZXlnQkpmQk05a052dmszb2VacUVIQW1vcnM3OWdJQ1Ru?=
 =?utf-8?B?N1YrV1gwb0NMalU2WDJHY2hwQ05VZlcyVzZwT3dBNzA4OGc1djlUbk51cENG?=
 =?utf-8?B?RjZleGtpemZlRDNJVlFXelVITFdlcmZVY1NISzh6MjhqMk0yWXYreTlwazc4?=
 =?utf-8?B?UFUveFVEem9xQzlhazRzRnNsVUR2alNNWGVIS1BLNlA2Y3R5cUU1Mkwyc2Qw?=
 =?utf-8?B?OWg3eEtrRGFqdm9NZEpnN3RpWURtc0JjWkkzV1gwallZSWo4c08zb0NEbFNy?=
 =?utf-8?B?ZU9COC84YnMyRXkxbHF4ZFNHNXBwemNnQVNha2NSdUYveWV4MERWZnhhV0pU?=
 =?utf-8?B?c1lKOUJjU25rdzFiZWtoWWs0WURsK1FZdmR2T0FqWmM1OHFkNkxhTmhzTmU3?=
 =?utf-8?B?Rll5VHo5ZzkwU1FvL0wxcHNBc2hWeGZPWUFTTEZhajg4NW5NWEVJVGlaZnBY?=
 =?utf-8?B?cE4ySVZ1UHNHNFNUaWswT1ozUmkzWGZ3bUN5a3lYQTBaSlc1cWdhdnVxQW5C?=
 =?utf-8?B?SjBhbXNyeTN0R0xBVytxRVhkZWNBUnNkTlM2MjJHWVY1RzNzenhpMHA3ak5y?=
 =?utf-8?B?Z09CSm5NbGtwcTNFQVdBUS9nZ3JDQ2h1TEt0RmJyUmtIazh3Z2tWUjVQWXZT?=
 =?utf-8?B?L0ZDc2QyaU9qREZpeDNDQlMvVlN5T0pjUVZyQUM5eEJiQVYxZmQvajQzVGNQ?=
 =?utf-8?B?UDZSeHByWHNCTlhZWUtHYzJrVUJRWXZkQ095eE9JUWk5ZTAxQm1sdz09?=
X-Exchange-RoutingPolicyChecked: Cj81UXx6JzlYS/0anu6pILp4iZeCTRLkY5uN9qE8WE0uSwIw6pQ6UMzrymnr+wBzwfl920u/Dk2u7B0PXVWkvmKxad2hz4HTjbQWqkxCbc0EsWuppF1ozC3KCgGPtwGFRoQZ828QWrBNfBJiFkFhLWG+UehKUDUFfbsBk9JKRCrlGUFX8Ya6+yvLeXCx2FZdCmgz/r6aoO/c4ra9xGuLuxlr3SW+rkjVaIcPSa34orMc7YxyRZOixeKIQXtzWE/suSr0rUaD8kGChA4xbNhyp3kgv+LfFThTCRmo7o2EPsw3FQ7DiAtnDgq7e6FYcwII6LXa4a3q3KwAOzMtzOhYdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0872ff6a-dc3a-4a3c-f804-08de947e1fde
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 08:17:35.9322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMbNErqaVoLb5l1gCdHF+16w1bbr/ZslrTOAlQVa88bHcCDTNFG2Gnt9ql5cn3SgHYx8Xoamwb2oPQso19KWdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF291EF9BF1
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

On 4/7/2026 11:13 AM, Suraj Kandpal wrote:
> Currently many pm backlight tests assume that panel will stay up until
> unless we tell it to go down or AUX transactions are happening.
> That is not the case, some panels when they detect that there are no
> changes or commits going in, it will go to a lower power state. This
> causes issue in this test like AUX suddenly timing out (mostly in
> fade tests where each backlight change has a 10ms sleep and many
> steps giving panel to internally go in low power state). Also since
> changing backlight has its own interface it does not count as a commit
> hence does not contribute to the panel staying on.
> Also trying to change a backlight when panel is not up does not make sense.
> To solve this setup the output and do a flip to make sure panel is not
> down to simulate a real life use case on when backlight is changed.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
> v1 -> v2:
> - Remove setup and commit function from check dpms as it is not
> needed there (Karthik)
>
>   tests/intel/kms_pm_backlight.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index daa70c716..f108e8387 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -84,6 +84,24 @@ enum {
>   
>   IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
>   
> +static void setup_output_and_commit(igt_backlight_context_t *context)
> +{
> +	igt_output_t *output = context->output;
> +	igt_display_t *display = output->display;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +	struct igt_fb fb;
> +
> +	mode = igt_output_get_mode(output);
> +	igt_create_pattern_fb(display->drm_fd,
> +			      mode->hdisplay, mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR, &fb);
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +

Sorry missed this part on rev1. Instead of creating fb's everytime we 
could just create two fbs and toggle b/n them. Also remove the fb after 
the test.

Regards,
Karthik.B.S
>   static void test_and_verify(igt_backlight_context_t *context, int val)
>   {
>   	const int tolerance = val * TOLERANCE / 100;
> @@ -133,10 +151,12 @@ static void test_fade(igt_backlight_context_t *context)
>   
>   	/* Fade out, then in */
>   	for (i = context->max; i > 0; i -= context->max / FADESTEPS) {
> +		setup_output_and_commit(context);
>   		test_and_verify(context, i);
>   		nanosleep(&ts, NULL);
>   	}
>   	for (i = 0; i <= context->max; i += context->max / FADESTEPS) {
> +		setup_output_and_commit(context);
>   		test_and_verify(context, i);
>   		nanosleep(&ts, NULL);
>   	}
