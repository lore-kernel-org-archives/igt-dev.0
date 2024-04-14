Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21470C4345F
	for <igt-dev@archiver.kernel.org>; Sun, 14 Apr 2024 05:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6172F10E24F;
	Sun, 14 Apr 2024 05:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knkYE0Ed";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E693710E24F
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Apr 2024 05:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713074252; x=1744610252;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=/7rljARPRlo9+L+El4gdhHalvEg7Ys+jN4yaN18GGnQ=;
 b=knkYE0Ed00+i1XDito1/t1wXlXu/+6pYMyIfvghvYHFfdFwAEWPW2UZq
 47wCFXByvxkgzgcJCuRYdAjzNnAYM2Yd4vYIxQeRfB/gmPRRucqrKVqVo
 RtBg1foNzKnfj1O+Zk1OkRT59G0LgM46NeJkccNRH506ZR+5rXRQ+/Wpk
 KHs3KslSNG59F0r8tWQsri0eN3x0cIij1EV+CPil6EjFwlU5ymYzv2gJD
 BO3YcX5Xy38Re4KRgHvcNhR7+ESPAb381W+g9s2zlUNBANzoEiIaAR8gX
 UiIUlab/YpB2PegPJFsstRiQcETArRHAz8Bzg2oMJRJfL7RxiUSSDRZkk g==;
X-CSE-ConnectionGUID: 6ohSjUsJQc2JEzAMpNsfGA==
X-CSE-MsgGUID: qDywruqBR6SyIRhx/qUzgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8340905"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; d="scan'208,217";a="8340905"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2024 22:57:31 -0700
X-CSE-ConnectionGUID: Vk+2izueTJOi7fgnP3v4bA==
X-CSE-MsgGUID: lfSdNiXORT2NAxD02WXzyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; d="scan'208,217";a="22182800"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Apr 2024 22:56:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 13 Apr 2024 22:56:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 13 Apr 2024 22:56:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 13 Apr 2024 22:56:52 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 13 Apr 2024 22:56:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nl5sbAnTlq+ag+WAxe5dRLgjZq4+s11Jr8hCpjLjrWrzLlRE5D745ly8Hce/OV/17cjwoTPX4kSynyMBE1xf2kv3746T8ZiRtvpb6cecUQa5s+6xdG1wP88SjifJYyh/Ih7oxnspQHw+2r6ZdMQ4nLNg7KBTauRFkGnftQ7IQVaueaJYOuwv4LHBD02QKQkI1uHcK3L2Gs6l8xQJP4Mt6gbtlNYkT9QXpIzw3qcyNYivkRwGjhDoxyzMLyWvf+Redmaf/nAo2CE7jJZXHRz3I9mKq94EhpgQgyaJ0bpB2PCF/A/JJ1gk7UyyZ/VGlh51bp16vQoOD6J0aAptLCGfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1s5Tf1a/JvSZaoVhS1MshzfU5rV2pT90YftNZSzqm4=;
 b=UJM91SFxpfdtm3eSVeiY5NrZUheXWRe7MDt1fRpnB2Yjybem79roJ/qfKPtk8iOTVTVbGUqsvXCrsHjeoxLP2Io2U2hwE9Tck0xUdcRE/8Eo9WzZlSk827qGKZgnQLg8Ehqq6w0T+ZKVpt9Q0AgPDH/6hI8uhZ6dTYgTCD0B8c0wbfp926aeoAg8jvr5UkjJuFGaIh1Abm7CMZeU9xrvGoMpgLnF/I8c4/MB/OAs3sAgtKR5u4k1W/IBTGbDEVjd38H+tnvfTiH3a0CELlAwRZ8YCuiZXEv1L2/G35jXKtsuKvzaHh3gQ6tkmfibgKSR9tNHzeXOGD6OC5ly2luiGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Sun, 14 Apr
 2024 05:56:50 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7472.027; Sun, 14 Apr 2024
 05:56:50 +0000
Content-Type: multipart/alternative;
 boundary="------------GfEduh7lCfgtlMX5YS1xAAJJ"
Message-ID: <d5c61921-285f-4029-a0d9-783aa3a25c31@intel.com>
Date: Sun, 14 Apr 2024 11:26:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/4] lib/kms: Adjust forced_connectors[] traversal
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
 <20240411183450.6417-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240411183450.6417-2-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: BMXPR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::29) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 9095cf87-6fc3-4ac4-3204-08dc5c47ad5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /aOFkRsquvwMKm6PlZb3oDPmO6akyNKe3WRv3bLYCtIfbI7aZhzzxrDvnyj6t3dTVR9+mdQZ/tEzXOl+Qhh3ODkcQIVHqKyYI/pS02YYzOaefXtGeFfPcJUaqlsM1Noww9Om8CpjVrVVK4SB01aCDEdEDdsIAE3h8wjT5mIi6C0leqPTdrQm4wwAWFeO/wWfk2DuwyS6PIZDuBfMtgMh7JWyB3AUFDZs5WHKor3i8ViMUDxxuppG6wM04M5E/J0TbxM6MWV0Q8PD9dh1KYTEFHEZcLGeFoTfOqi86DD+ejgJdbYL0Kk36xYfgKInwpNAnVn9Hf7cnvbRNYDw2a0V/RcAmTDR4KffOSMw8AYfY9Z86HSyNA4bYNVXKy11EguYhYbrsuTpkXCy+i8oH8zCLYS1rmtPomizkmj6jJsR5blznrirB+TMhCH4CSwHcZHMTytg9+QHs3I4mgTXi/8HEBhFmFCROR7zj4zSkPw3eU1CGbZA6qXRNXOuiou6RFlenn370Dfs8O7Ci/p5zjwWGH5CemSUDL+D10yEZrZsAOd4s9PqLJ+T6NJ6BOY1MM1uYzDQtBSNCcb0nG05xtbnxMgo0djF6LcmNEuGpXNeZYU2B2Bi7jqfatxMTUok46qIW5i7vp9YB3Q++g2hU5EaT5k2M7XuHd8IeGT+5YJXhck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWE2dk1kc2UxS2w4REZoOEE2dHNjZWZtdkkzcUFRcEVSMjRFZ3k3bFB5cTFZ?=
 =?utf-8?B?TlBZbm9VNVR2bHM4dU5saVJqMkRESXNTN3pSZWZmNW9qdldzR2pFSWNtd3Uz?=
 =?utf-8?B?SVhaODc0eWlLRldBdFZ6VlRlMmtTdkNBaFAwZnFIbXpLSmZCcjJjOEVRcG5Q?=
 =?utf-8?B?UEF3NER6eFNMS295c0wyaVE4U041ZmdBSnpxUDRiV25MNXprTG1Ta29XNFI1?=
 =?utf-8?B?SGpKUzJSeHI4Q0JQdUY0b1hVbEVjLzdPMTQ2T01RMzN1NGxHY0MwL2tLcUF4?=
 =?utf-8?B?cEl6MDRORWRTWkgzMnFyK1BhTFcySkwwNm40RkhjTlhvc0JNcEl6b2ZIWVBZ?=
 =?utf-8?B?ejlpc0tTQjhPZzR0ZTR4UElnc2NialpvZ1Vlc1ZqQWMxYktLYzdUZXRnTUtU?=
 =?utf-8?B?eWlYT0o3MTJOTGh3bUJNZDBGMWZORWNEdyt1NTY0WTA0U0pZWDYzcU5ZdUJ4?=
 =?utf-8?B?Q3d6OW9veFhTczhRQUFzaWdMYkFoek9keGU4ejVodHRvL2tlWnREd0tZa05v?=
 =?utf-8?B?QmRKditXQk9sM0RaV2g1d1ZGWVJVaEJsRlZNMzlucVhnbVRyTHJwd0NHaWxW?=
 =?utf-8?B?VzJNbDBjVExVcGxlS3hPVXpUUDQ1ZGprNWVQbTRIUUtWSTNRb3VaS1FXZGdl?=
 =?utf-8?B?SXp2OEtIS283d1ZlYXBoNmtJeFB4Z01Da1p2Sy9KUy9UUkxzdVJ4SHJqdlBM?=
 =?utf-8?B?VnVQMUZBUUJmT2dveEZXZVNXVzFmejd6dDZhNVU5ck5jUUE4NlFqRG1YNkhn?=
 =?utf-8?B?ZmRwbDUrcXlOc0FlbjgwR0cxKzAvcEJRZjAwTEc4UEIrZFVuZ1pNTDlRemgv?=
 =?utf-8?B?Zk9uVWlTR0Vwb1dDbm5KWTI2M1JjajBmZ2pudms3MlVEem92VmpZcVUxM05H?=
 =?utf-8?B?dXBiZEE4RHZPaW1EVjhtRHl0TExraWo0WXVXYVhYYWZMWEU2YlI0RXdEM0Fh?=
 =?utf-8?B?VFBOYWd1bE1UcWp6YnFuTGtoNVdWQ0w0S3NsazVFZ1hiNTVPOXMxbmZVaE1O?=
 =?utf-8?B?enlJRkUzQVIzSWhxRUZaTVNxdDBDckF6NTNKbnV4OEtHSUkvUVdmaWVZTlBq?=
 =?utf-8?B?SkdWaG4zRXpTRi9Cb3RKVDNRdWEzUnU3aFpNVzZReDlXR2J4T1RZUHo0NWdz?=
 =?utf-8?B?TXM1VnN1VlJvS1NvODhpQXVRLzNFd3NGOW1tRTRrejJWTXpSanhqVCt1S1p4?=
 =?utf-8?B?TlhEaXhZUjlFUVc5Wnl1NEhwWlhKOXNsdWpCL29SeExYb043ektGV01SNlB0?=
 =?utf-8?B?bjZIOTQvRVYwVVR2Mit4RXVzZnF2TEFQQ2ZRODVsMHYrVzRsTzJPcUlTMk1y?=
 =?utf-8?B?RFIzRFRNaVdaM1hsdHF5eXlQZ2NIR2xaemFKK2xxM1FESVZNM3Z5Qm5DS0dj?=
 =?utf-8?B?RllDUGJwZm1mTUg0c3FDdzA2eVlEb204SHBqOUJzRDh4Q1gyaFVmcnk4NCtD?=
 =?utf-8?B?OTJqMStDU1J6alZybFV1L3FER2djNzQ5bnhEQnJ6dGFCYXk1Wm5oMERMNW11?=
 =?utf-8?B?VklyekViZWcvSEVwYS9rOEEwZlhFVWxmYldvMW1HWUpPeXFwTHRTWDlHY1Yy?=
 =?utf-8?B?Zm83MG5weXF4V3ZrOHRhNUxTNDVjUlpORS9LZG4zZlhKbVBsWVFENTNTVzZO?=
 =?utf-8?B?S2FDN0c4eUhzbVBmRzhibXlBWU15QmlCK0lzWmhUYkMrR1lURzNoK2ZmOWVk?=
 =?utf-8?B?eHA3dWhPMm00VUpONXNHUGxIa2xpRzZIb3FSZ3ZIZHBmUjkwRmRPakZWeVJm?=
 =?utf-8?B?dHdqcWJCSXJFbUZaTmlCbFhVVkR3NzRXVlBYVHZWamVvSVdaUEZBdVR3Qzhz?=
 =?utf-8?B?SmhRS0pzNkhhbi9hSTN0b3dCNmQ1RndhTTQzVzFMc2pSQzRwNUpjYUtaOEFS?=
 =?utf-8?B?Uk1zZFdsay94QTdBUS9PTGorUzRXcFFqNXZ4bWVaMk9KMHNzODlZMHBHQmdN?=
 =?utf-8?B?ZS9UYmdUK0EzaXFEVnZWZ2dLMS9oM1NPS3dCcFRUVnY4bHJrOTcxRTRMY0dL?=
 =?utf-8?B?Zm1zM3ZlcXB3MHcwME5lR3ZWWTBPMU9XS0NBSzVwU3NRUGU0Kzh5ZEJtVm52?=
 =?utf-8?B?OXBqeXFzbk82cWRjbDA4UDZKcnY0M3dWVURzWE4yakpTeU1NTXE0ZjZUaHEz?=
 =?utf-8?B?aytlMjRwT3JQZmRnK3MrT3Y4blpzMGcxS0h5MU5yWWNDYjF6QlJmVkc3aEJq?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9095cf87-6fc3-4ac4-3204-08dc5c47ad5a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 05:56:50.3919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3USrRHJwV/+4XNj/ZaFOKaY+M27fncC/zdGi1DGnlHQ6DRedoE2XgYgaMLktvl5WHGSHcmugMRp6SN+WIV1Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
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

--------------GfEduh7lCfgtlMX5YS1xAAJJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 4/12/2024 12:04 AM, Ville Syrjala wrote:
> From: Ville Syrjälä<ville.syrjala@linux.intel.com>
>
> Get rid of the sentinel in forced_comnectors[] and just
> use ARRAY_SIZE() to determine the limits.
>
> The sentinel stuff actually looks broken due to the use of
> ARRAY_SIZE() in forced_connector_free_index(), which was
> apparently my doing in
> commit ed6539ced33e ("lib/igt_kms: Rework forced connector handling")
>
> Cc: Kunal Joshi<kunal1.joshi@intel.com>
> Signed-off-by: Ville Syrjälä<ville.syrjala@linux.intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
--------------GfEduh7lCfgtlMX5YS1xAAJJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/12/2024 12:04 AM, Ville Syrjala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240411183450.6417-2-ville.syrjala@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">From: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>

Get rid of the sentinel in forced_comnectors[] and just
use ARRAY_SIZE() to determine the limits.

The sentinel stuff actually looks broken due to the use of
ARRAY_SIZE() in forced_connector_free_index(), which was
apparently my doing in
commit ed6539ced33e (&quot;lib/igt_kms: Rework forced connector handling&quot;)

Cc: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
Signed-off-by: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>
</pre>
    </blockquote>
    LGTM<br>
    Reviewed-by: <span style="white-space: pre-wrap">Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span>
  </body>
</html>

--------------GfEduh7lCfgtlMX5YS1xAAJJ--
