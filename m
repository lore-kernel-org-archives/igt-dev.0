Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1447310AB838
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 00:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE7010EC27;
	Fri, 27 Mar 2026 00:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yh6bMEGd";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013053.outbound.protection.outlook.com
 [40.93.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E936F10EC27
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 00:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfSuvk832Pih1+33Wat+qkqpeZiOzZx7r/wS4L3YRV1DEHZPQNHw7t81knnJi76pjISE/7dwzOfpt/iscAwAL7xQ+9ucb4jYxGkPzCz6c2vbESm22IYdz8AICuvP5YKaIGJ38IoyDq7+WadGLEKkEzd6BokGn5ZtBTIMm1PLS+PjskqYsuSQZUx1pCl6q2WRAoI5na5xa5ZA13b1jBsYaHRa0mRo1EGzZdh7XtUrOUwftVlkosopaHQXqt62DpzASdFiQlRsl4W/igBpGEvMH4gUD9cWjgrZgeRiCKvfUjVZ+W/Ke6pLksFa3urkEv8FlZNXmePekNF2a0vntuQu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lXWj1TjP32zFB6u8PCkUhpmLJ5At7myWk8ms4GM0T0=;
 b=sTK9nhoNZDPPC0m4hZH6+KMc75OGNdcnuzQGZ9LIQ7SbC2RRdgp2Ew4jnrF1odeLgZM4Za4JEu0YA7xbAoxqlK2ZSXmfHh0KTR6O48RMamgBl/TeSaXX2zOZlF8+OhXGmBSC3O5jMDJcoXTafhnd4lpfzSZRZljOPGge8SWlmaeBe876Fivci0S7LOMohtGalWgLvGxwDUI+qHb2bj2730hq49VNMiYgXhfOrYWkAUa+pOHPN7GEseejYcsSzeMDg1lIKGHae8G0n3pIvSao6UDcX74bB4VcbRVZ03i2ZL7UuBLMcB+A5xsT2hpkPSRJMMvBDUkwFzPJWBVqTdVhKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lXWj1TjP32zFB6u8PCkUhpmLJ5At7myWk8ms4GM0T0=;
 b=yh6bMEGd6+0Buvxw/aNxOFFy/dEOCeEGCDDMcpdUOI0WR+NdUiBaRz4scn00AOIzqTM0r6/qwwpyUecz+7iMLq5UOwkBT2X1H2HDa4oCP1JC87KnbS0vfhHTdVY548i6/4y6bZAc/L7a4yT6Zz9h3c7VB58yjabH8stCUcFpZII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by LV8PR12MB9333.namprd12.prod.outlook.com (2603:10b6:408:1fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 00:49:34 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%7]) with mapi id 15.20.9769.009; Fri, 27 Mar 2026
 00:49:33 +0000
Message-ID: <29138133-adad-4586-a2e0-30772cb915e0@amd.com>
Date: Thu, 26 Mar 2026 18:49:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/5] tests/amdgpu/amd_multidisplay_modeset:
 Prepare for returning NULL from igt_crtc_for_pipe()
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <cover.1774529527.git.jani.nikula@intel.com>
 <42c82fdc808ed80c3b3eebc8e2d324bf06c4cb87.1774529527.git.jani.nikula@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <42c82fdc808ed80c3b3eebc8e2d324bf06c4cb87.1774529527.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:303:16d::16) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|LV8PR12MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: 710250a3-8107-47d8-c85c-08de8b9ab687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: klg/0745U3EiyYf0gz4sahA/5b5ocHbSAzoOSiCHYHcmhidWLtIRFx0RX605l0GeUUlsaX2jaiYiz3tiEnZfKiTvvDmeyc8ra+sHwPqYkt7mzW3W7mF0nyWrkrzTCDDEAMe60id6RSTs0CKhjyCEA0k/+gaMArhHrquiodRA6VVSpGZz+zd/8W86v4MBAjkIk12FKR55aqcdcvR3UrQmrqjI36iSz2dfgMvZht+U5GlD6v6po7iY5Olpu7qQZmVuux4xNKLnPta377+c/3vHqjC4okyt2VfzYDIVIVNL0SegnVhL8NlAURxNZHVVRX/GHhNsG+lxcrE1faS1ZJGBMXUe/29eI/AiIJPKS+/wcNWo7GPrMMoxm5HacqtY9aFtLokcFbr6fbAK/5ca7/1v80oPTrSbRpu6f0q9cMhR1pD8t+4mC+ZGXm42tApYhkZeaoTAtyRyn8OxlrgclLxCVNbiaobQhPaTOT6vA6nJYiSp42+ELcFGuvTZEMTXHXZiZykV4TCo50Twm+HOsYgcRWJTkbFqsaI0jXV+uZd2oKLzocsUUSZEHkneTvTHABoWzx4DXw7yehEF45h30MygCXjIIH+Hzd8n6x66yGWbPnASyRb4Y0nAg7oXD8jqMZZCWosFQ5OGsmfCeU2wVEF7nxsku/gawgzPJKzHwmI+FY619YwhPPopClOFRqPJ41+owYIMamOoC7/gjFR5mYoevao+tnoa7B3E7jZsw8Xn8e8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDV0bkQvRnhJNmRsSU1RaGtrRFNKNGlJR1gzcUVKTmpBWk55Rmh2NXZ3SFJK?=
 =?utf-8?B?N0dhK0QrMUkxc2tiZUZwMHlia2xCNkNRK1BEU1NueDAyZldIK2xrWXFMVk9h?=
 =?utf-8?B?amU0M3lnU0J1OGxCSUlSVzhNQS9uV3RyTmp0cUFSTEJrcFNuOWNya1R6b3Ew?=
 =?utf-8?B?dXJnbXREREc5aW45TTBCbEdCdE9LZlg2T1ZaRWtPYXhQM3prbm1OWVRIMjhI?=
 =?utf-8?B?ZzhDSW4raWZlR0dFTDJoVG5VS2ZDbENTNklHL0pkUzA1SUpVeXN0ZUtQcmRC?=
 =?utf-8?B?TG14VDlYY1JGMVRQT1lkMVBTMlQ1MWJhb0ZwMk03VUpmRGNzRWVkcXFJMFcr?=
 =?utf-8?B?MHhBVEtUYkJ6dFZ3dFJpdVgyVTh6c3VUd3lPU3ZkN294eW9yeDV6d2NpMHMy?=
 =?utf-8?B?cTNXZ1E4NTBjV2d4STZ0WnRNSjQ4OUp6ZUpkTmxvSERmeGlIZ2VyYXNwL1B1?=
 =?utf-8?B?em00MFV1YlU0bTVDOUFuM2JaRnpwN1UrSXhIT2ZBN3l6M1ByK1pjSzJSZVFl?=
 =?utf-8?B?MER6WkNqdjlKZitoaEVvdktTeldCQXRtYzhDNDlXRW81REFjWUJoemd2N2Iz?=
 =?utf-8?B?WWdseGl3Q09wN3pxc0dheGxqZ3dJZFhQZ0NpaFpzU0hFYzFyakJ6a3ExaGhU?=
 =?utf-8?B?Y1g5Mk1BbitWeUJERFBReFNzTUFQeVNmTU1Ua2Q2WitrQzFYTlRkK1hUNjVU?=
 =?utf-8?B?NkRob2Vqalh5VWpMbDdRdkZLaGJkNVFlRHFCNXlub0JaMUNPeHRhNUhCNFpX?=
 =?utf-8?B?bmZsWHBsWkt6WTdrNDkrdWxzZG9qZW9jQk8zRHhla1h5cVZtWC9MM0tmanhu?=
 =?utf-8?B?SU9VVnczTTRoUXZlNmpGdytEUHpuRS9vT1o1eGRCajJJejFzSkVLWDhDVXM0?=
 =?utf-8?B?YlVVRnIrQXNxbXBOU25aWTNKaU4xZEVXb1NxeXlVbDR1cTZneXFHRnRQUTdG?=
 =?utf-8?B?UDQ1QUh4TXZEL3pSRTVSV2pmZEVrSGU0S25mUEEzNVVKNnhzc2R5T3BIV1dh?=
 =?utf-8?B?ZlNtQU5tWVcrNWpHK1kwQmFQRHRLV2JoK2NDUnNIWXRTN0JPYkQ2MEpoWFBz?=
 =?utf-8?B?alkzdFR6MEJwRnlWT1Fpa2tTRjAveDQ0b2taRjVXU3FGQW5sNk15dnlTRUpp?=
 =?utf-8?B?ekorb3lUaTI3NlFZUFpHd1dxbFZTTEYwQTlRZ1QzeEFGU0NNRUh2aVRPdzc3?=
 =?utf-8?B?TVVMTkNXOXEyK1F1Q2JyWW1rdklqbUkwWm94SnhLbXRXSEd4R0NPdi9qZGQ1?=
 =?utf-8?B?SXVBNHRuZ1IrL2FaRXZ6NnVNNEJoTUNmWUk3QXBFT3d3NWZac3ZMNzJ1ZjZv?=
 =?utf-8?B?cGtRMnZBWVNZa1MrQnI5M2pZSXE4a2RZQXJDWjBDbS9kNXltcjVKSVp0SklW?=
 =?utf-8?B?MC80RlZ1V2FZUnlITC96Wml6VU9qL1IzMFg0VENKRXZpUE41cEo4T2JXYVNJ?=
 =?utf-8?B?L3Z0cm5lS3ZtbHp6N1VrRnRtVlZOeUl3OGVDcVV1ZWVabHlsajlhTXVjb3Jy?=
 =?utf-8?B?TkFJR3kyOWJFTm94bjNTV2Z6UUhaaFdMOUQzVkEwM1Q4Z2RHTml5b29GTWlm?=
 =?utf-8?B?WjJUTURHU0gzTUt4eDJhemtKNnVyZ3QydEg0eEVOeUJSblpXQmJ2RW1mYUpt?=
 =?utf-8?B?VWN2dWV4VkU5Y0RXTkw5K3lHOXl5cERIQWlzaGxRdk40NGtUWTRPLyttY3BG?=
 =?utf-8?B?SkIxRTFMWkpOeWxweDBnSzNsWlRiUDBPVllSUDIyK244VmRiT2VrWitnR0E0?=
 =?utf-8?B?ZTBiVFhBZ0kxU1ZqQy9TWEFramFCSENiK0pzamMrMFdLMll0ZXBuTjZLWlBw?=
 =?utf-8?B?RXpBTlR2RVZuM0lTMTdsVzI3ckpWSytVR2ZxclA5OVVDTXJMbWZoc203dFF3?=
 =?utf-8?B?b1AwRmVYcldWcTlHT0NaQzlpb2o5ZmtQUll5cXAxNm10UWRkMEVwN3lsdGlu?=
 =?utf-8?B?ZDhBNlJBOWJWdktFY0VndHZIcUtiTGJpcC93TWk5QWJuMDNOUkRKbW1lbmpU?=
 =?utf-8?B?RWFCdmI3UmV5UTczUEJUbEEzTXAxcFJhTlB5bFpkaXdkVUJmbVBhMERrT1h1?=
 =?utf-8?B?aWtzME0wcGw4Vk5kalVOZC91NVFycTE1YjRWZ3YranFzQUd5MUZEczZnTFdv?=
 =?utf-8?B?Z0pNSVhhWGNsN3ZFWk5FRVo3eE9Vc1FJWDB0ZVp1SEp4RXFZbmJOZzVpVHZV?=
 =?utf-8?B?TlNNQVJTNmNUM09XRTErYTFsUDJKYzl2b2MxRzlrNWl6SlF6M0RRZis0NE1Y?=
 =?utf-8?B?bk16SFdiQXM3aDg4RVVJS2phUHd6dU1obVdaN1lua3Y0YW9lcjlqNFRwbFdh?=
 =?utf-8?B?WFdtZ3ZQenV4Tk50WUZ5bnhmbWVTeTJwSXdkUlhIMGNxRWlVNzViQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710250a3-8107-47d8-c85c-08de8b9ab687
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 00:49:33.8497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhEZpeVRdp+XNCMM3JdMokfW/xBCwN/cmlACod5OUwaPRnVe6rQsNARkBaeGwhnUkDvZIZHH09k9siJcRKDQ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9333
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 3/26/26 06:53, Jani Nikula wrote:
> AMD should always have enough CRTCs for the test. Assert this is the
> case by checking the CRTC returned from igt_crtc_for_pipe() is valid.
> 
> This prepares for returning NULL for invalid pipes from
> igt_crtc_for_pipe() by ensuring the test logic is sound. The follow-up
> can change the check from crtc->valid to crtc != NULL with no functional
> change here.
> 
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   tests/amdgpu/amd_multidisplay_modeset.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
> index 98ca2c79470b..3aa7b3483a28 100644
> --- a/tests/amdgpu/amd_multidisplay_modeset.c
> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
> @@ -327,6 +327,8 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
>   
>   			crtc = igt_crtc_for_pipe(display, j);
>   
> +			igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(j));
> +
>   			igt_create_pattern_fb(data->fd, kmode->hdisplay,
>   					kmode->vdisplay, DRM_FORMAT_XRGB8888,
>   					0, (buf + j));

