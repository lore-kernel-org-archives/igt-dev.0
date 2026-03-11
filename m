Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E711125842
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 15:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA35D10E205;
	Wed, 11 Mar 2026 15:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ag/6CMom";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013017.outbound.protection.outlook.com
 [40.107.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FE510E205
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 15:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMw148e85rBrxeYXmWL7KBWfMXtfleNkLKuHfwfEdXl9UaeNasmjpx713KFcXFxsm+nyvhE+n96fQNl5CWtjsKa88FlA7NjxdeHLi5BCYll8igmaIvlG3d26WoI8tpgXtirpxMovgyYoCyO+op3Ws9tnRWkdZlgkzwFBgPWBxvMpwsh/Qz3ptA3X1LtrKHVFExoyzzDK8j3gJpoZRx8nyXRRxHMaFW/diWt/4SiKPX+myHvhXvQqIQvoHwzfT0xRVq5lIPWv7qjrO4Hsh91bVpf9ZM1teTcJgVcmtgibv4mkdttqvrxwiV3tt3UPQKJK50KkynApD93JvY3mWMOEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp7FDaFy5FPOZzhjZCv4DVy0rK0Tu3Y9NnJ/Vzrld74=;
 b=JRAI6zBZcl430WPDLp8hrBsq9cQQAxLNH/Ge2/vs+LYJPIkLd0vlALMIWdzhyBbccYlQyLVVtQ22VATUBGFCsrZVphf2YmZ8YS8nUJeLd10ZZ1DGS+S1tpDKG4jeVg8QEy2oim6YBcwKPdOrK8DEdO/0yyjGmMiQ5i5pqofjtkCV5lMnJSPmQfnl3ER4p2k6UFUtM++yJMDD9oZLEaHqngSCPb2ud4yA3KnF9sZow7fLrIkMbAu9td4ZWNYGKHG0A4nFEVm6oSd6dmVMLDdW2xasz392gipyU8mcis513BHfsUiEgYDuWCdzQ5T2d/6TCtsNUUI8gYVadUfZypQyqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp7FDaFy5FPOZzhjZCv4DVy0rK0Tu3Y9NnJ/Vzrld74=;
 b=ag/6CMompPe1vsl855/igR2l14LMfgtUpnK+0AfdAXhqF0bixMXs4FgR2O7l0Z7cdZFyRIAksogL3v094CTW8GdAvpRElj15x43AnFKVzw3sH6v5Fm4kM0xaDYuCqAJC8LZp8Y/1g/gDydDFom8CMDiyFsPFfo4eZkEAtvN1qwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CYYPR12MB8750.namprd12.prod.outlook.com (2603:10b6:930:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Wed, 11 Mar
 2026 15:44:33 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 15:44:33 +0000
Message-ID: <a3b00794-58e3-4821-87f9-bf39aa042e02@amd.com>
Date: Wed, 11 Mar 2026 09:44:31 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_properties: Add panel_type to immutable
 property list
To: Chenyu Chen <chen-yu.chen@amd.com>, igt-dev@lists.freedesktop.org
Cc: mario.limonciello@amd.com, chiahsuan.chung@amd.com
References: <20260306084652.797940-1-chen-yu.chen@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260306084652.797940-1-chen-yu.chen@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:303:16d::35) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CYYPR12MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: d9244a76-e819-4bef-973e-08de7f85172d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 5XUtYLxe8bQXzE7VRVY1gw7oxOlxqT6/qUZ2I7aUAllyMzTMhTuRYG7seAnPyqdM+ytMq5cV7TMPY8uFFrEvA+o0tyw6k1j08VT5Vr+ob+w99voD653gy7R7YlhBhmoDxcFxumJ14cXrCqnwdY15DTGHm660gWPLlt5n8TFhYbirzStOGY8QNoP77EGtvtSpsAbmWnLu/vel6OrPmvo/VZYiG4uCKDwL6ZOAqBw3xkMxa4WzbzG9ZJIXAdaDTxL+DiuoSwohNi9974N3mRQiZnj0w15QB0WHovJJUohK5dS83l6R3/PwcSjhz/uVAW030qeZ/zwecsQxOfg0YwM28dLUxMIH71Wr6v9A2jrcXoXqdqcgDlIGMjJAgTi25ZlDOmtr86EyZ8JWV/LUJCaJ7bsq0ommt+IBV3cSuT5pBFSZfAiILpLAXzfN7B2WC10u1cgaG1iol5cDTwcHqsdlJEIJp6nRL78r2QlKC65PtqilzJiapkzFO0rHXgfWOojdLVJcDOBRdBS8AVqRlRJ1jCCk5Qq97ZpjB493GacWTVD3EM/GTtk8eYmhHtxj9Y83Uw2HpVXTEwfEneUrRnmZyOcYbRNB8MI5pPPoHd3K9qAfZgUP2dxf5w/Xy2XrapRx/dSMkH84vo/7q5cb05JyNEuOYseCfrcJqFofKM18YW9N3rv5nQVV7COcJzhW/mtl5CJ1Aqyw2r4+yMYfl7p5EbkK1hYtJt6fZ0tWG++/L4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUNzTnBOWjdJVjVjL0FlcTZIOHFHSVhHR2NITDlEczBKZ3pqbG5MaEF5Q0da?=
 =?utf-8?B?RGQ0cVgybmRraU5YNDc4L2lqUnZQM1N4N1BHNmRzYzEwbUtaRFduY0RGakN2?=
 =?utf-8?B?UmRoTFc2eTJEVXZTYXR6UlFpRkpHb1hTNnNPVmdiekd5S0Frd2hsMkV5ckc4?=
 =?utf-8?B?anluWTJjdjRCUzVXUkd5aThlTUIvN09RWkpLSURBenE0OVJBdXo0OC9sbi9h?=
 =?utf-8?B?V3pZNS9XZ21tVmVzamtBOXBDdnA0czN5OWR6VitadVgyZ3VVTmU1QTErZmda?=
 =?utf-8?B?RHdCY0FlTXVLNTZSNGlQMnNCOFFpT0JIMDhKNkVJcjlYUmhSR1V6NmF2eUc5?=
 =?utf-8?B?L0tkak9aZEpJVW5jSDltTmlaYUZBK0RodytrOFlQd1Fqd2VFS3VwRjZMSWtr?=
 =?utf-8?B?VnJEUDl3MVpnSjVtK015aW5VNS9sZFFUZjBRQmpKMFVpbFJzSXk0UGdqZ1pC?=
 =?utf-8?B?Rjg0VGEvd3BvVkQ5YXY4UXY0clNqQTNrQjlMQkVSbzlIRUpKVnJpT3kwWmR1?=
 =?utf-8?B?VENrNVlvOGpDLzNXZTVLTUhYdWMwdC9DbExjNnphUmpIOU1xTDZKcDdKT3pD?=
 =?utf-8?B?KzdlckxxQzZ3dlU4NnhVdjNEc0N0VUlUUlBubDlYL3RWMXdPaGVvTUMvU0FS?=
 =?utf-8?B?M2p6Nmo0czdFNTN3NzR1cjhYVTlIWjZFdTZJU1Y1YmtGSjdIenRjQWlPNDlP?=
 =?utf-8?B?bEdvUXhNdGNaSHVqZE9xVWcra1F1anROWmphNjlnSk4vU2pnY2FJOFh4a1BI?=
 =?utf-8?B?a1kzNCtTNFVYRVpEelpDNkVkaVFuWTA4SDVUaWxrS3lwM1pQMGRmNlVla1RM?=
 =?utf-8?B?U2NabC9jV3FIQTYzNjNldGVuTnF6T0RNRTV0bmdaMnV1aThOa0RBMGV1SS9P?=
 =?utf-8?B?SjN2YmZ5cUIwQVdGczRxRzBRbG5aYSs2NWpKSGY0VThLS2FTYnRjTXJ0alNQ?=
 =?utf-8?B?cm1ka3BVWWxxOHNtL0JrZHpLblJZby9DZU5tRmQ5TENrNlVCcnZLWUo0SU1s?=
 =?utf-8?B?a3Nqa1h1Rld3RkFNbTRsOUtLeWRKaVFFdytpc0RlZUxiT3k0ZnFpZFBZL2Vn?=
 =?utf-8?B?eTlVM2x4RGVZNnltZTVMcHZZdFJjZUhCU1hpU0REK0xOTFRJaDVwa3paVUly?=
 =?utf-8?B?eGt4dkV5Y1d1VTF0aXEzM2xoc0hDNVRBeWlQZUQzWnFIZmhPMmNGcCtRMW50?=
 =?utf-8?B?ekF5WGFSNWV1cCsxQ01QUlN6MXhETXlHMHFaTE96c2lqMCtNQStwUE9UMk9I?=
 =?utf-8?B?UmErTFE5aC9ER1U5MjRERE8xaWNvcDZwbjNCOUhKa2YzeXhkUEE0ZmZXYUxX?=
 =?utf-8?B?QldMUWhaK1IzTEo0S0RNbVQwRDJXWFRUS2VyNDhJcVkvdFRsanZrYU5TRTgr?=
 =?utf-8?B?N08zd0pBeXF3VW9MSTJZaFc4K2R0MlV1bzc0NHdpdTZReTJlM2cyYzJLbEVT?=
 =?utf-8?B?L2N4eDczZXkzVVBZR3VHQm5FOGMzWlYvNzR4V3R6ZTg3WjJNWkJ4ZHd4VUpI?=
 =?utf-8?B?SmR3cU9DKzBIV3Q0VzBETkkyZU1WZWNlQU9vNTNHcE1lMWZyV3NHU1NTcHV0?=
 =?utf-8?B?QS9UMlBmWU4zdkJiVTVyejlhOU5VaGVsZld0SUR6d0dDeFB6cXZaUkJCSjRK?=
 =?utf-8?B?ZkdzQkFZckw0RXo1eEphejczRCtLZnNBeWlHRXNQd2hCSDl5VDZRR3ZienM0?=
 =?utf-8?B?UWtDYTA3VjZvSVcrckxITXBYc3MrYmVySVhYUzA4dUZwZEpROWFZNVdoMWRo?=
 =?utf-8?B?ZEJIeGptQmRBRHZnSVpqdkNaSklXWWlWK09YZ0dsaWlpeDdUdkRRcmtwQVNS?=
 =?utf-8?B?RW5WRHMwS1ZXbGRMeEdJSGl3OWxvMVZudlU3YUdkS0NpUGRRV3E2WTJxZHNu?=
 =?utf-8?B?UG94aVZ6UVh4cUc5b3hvVE9RRU42V0ZkbnJPd0lpY0JvVEVEa29XYURpdjdG?=
 =?utf-8?B?UmNmNUV1M0dNTXFPdDZkSisrR1Q5a2pnWXBvd0xleDlvaE9NQjBDSVdZZGpS?=
 =?utf-8?B?dEVPS1BjbElUNXNlOFJXUFV5UVdWUVYrRnhKWENXU1ovWlFCaVZ1Q1FrdG5E?=
 =?utf-8?B?ZkNDTVcxTlNtRHE2OVR0bnVqdG80dTR0bnBtYk0rM0JVS1VEKzVoTzZNWnhM?=
 =?utf-8?B?VXBFQTVCSTh2WVpYaVFnRFQvVDdGbkVvSWl5RDdmTmFvUnp0T05VK29RVzdT?=
 =?utf-8?B?bXpORnh4VTR3NWxKU3FrRVFQbk9LeFNEWllDdkFoRXg4V0Z0Tm56MDBHQ0d5?=
 =?utf-8?B?bmQ1M1cxRjB1SVBlcDNCWjhwOWYvQU40Y3ByNll2M3JkUENVRGd4MkNsVzFh?=
 =?utf-8?B?ZXkxUFgwOCtCNXdWcko1RDZjcGtMb29QMitVRStBME9hUm8yWkpWdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9244a76-e819-4bef-973e-08de7f85172d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:44:33.1144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnUUJVaTmGtpMHJsZcnHuh2L15KRpdmf/eziPSs1DCQWs716fMLV9m6ROsPNqygAftUUp/wXyuypmwuNwPw+VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8750
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

On 3/6/26 01:46, Chenyu Chen wrote:
> The connector property "panel_type" is immutable and should be
> validated as such in the get_properties-sanity test.
> 
> Signed-off-by: Chenyu Chen <chen-yu.chen@amd.com>
> ---
>   tests/kms_properties.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index d41003781..f735839da 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -560,6 +560,7 @@ static const struct {
>   	{ DRM_MODE_OBJECT_CONNECTOR, "suggested X", IMMUTABLE_REQ },
>   	{ DRM_MODE_OBJECT_CONNECTOR, "suggested Y", IMMUTABLE_REQ },
>   	{ DRM_MODE_OBJECT_CONNECTOR, "vrr_capable", IMMUTABLE_REQ },
> +	{ DRM_MODE_OBJECT_CONNECTOR, "panel_type", IMMUTABLE_REQ },
>   
>   	{ DRM_MODE_OBJECT_CRTC, "DEGAMMA_LUT_SIZE", IMMUTABLE_REQ },
>   	{ DRM_MODE_OBJECT_CRTC, "GAMMA_LUT_SIZE", IMMUTABLE_REQ },

