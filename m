Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952D4606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JljaSd0y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ap1WOj7e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2984210E301;
	Tue,  3 Nov 2026 17:40:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1150010E301
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 17:39:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A3HPDCR2553198
 for <igt-dev@lists.freedesktop.org>; Tue, 3 Nov 2026 17:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9NBCIEHRgd8QJgxxWBvLpMiBLQCIalRd36PHwtlBQLk=; b=JljaSd0ymmCJxgit
 uEgbar/l1WiRj3DEDduQLxpBEdrrBNHay+GG5Nq98JpPvhiSMNsVc8hI+UEUiqQu
 lwSlkcZeZrcN8Ack84Df4pU75GLvtmSqvj06RTX6nmdlLB6vz5ez4RcS5t4sH55I
 so2/M/UfFHkQDd8KJWtQaaLSLZhviLRRLJQaIkAjCbPvBQE1WrCgNUjX3npgqSrz
 A62QWBuvQNuUKtYSZDGEQ3Fq5bcT3Js8xavxfHZVFOoTUsLSGWb0PbPabPbmasxh
 UUVuKaD0F5UeKzI9Q2tYpHs+zCkyBEgn4UTlIk0msF7M8qRIIkbpzoSYyw8E6NPG
 6Y86Fg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bs00d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Nov 2026 17:39:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3662e7a9299so17276130eec.1
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Nov 2026 09:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793727550; x=1794332350;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9NBCIEHRgd8QJgxxWBvLpMiBLQCIalRd36PHwtlBQLk=;
 b=Ap1WOj7eD1EcU+a1Df6mY+1a8nUjj7AJoygAqx95pHlA0QS6nZU36xXlW9CJ57Wwm6
 PqHTQcNtiEsA+e7LgFtaLzC+BZvuepqR+MyVmlivImpFr0hgij9fqI/IM8TfRGY0LLwJ
 zBfIgez/We8yRhIX3n6Fjfro1JkMebffvivVFQbLlgZUYgbK+yvQGUgv/M4qzVjgpgiz
 Rekh4TXIaYGm3k4npeWBDilt1UBQI+AyfpZ10YI5wzdzQPYhfqRDaBdSfW5modkRB7HS
 OrsR3oWnt87D1YZVjFTD0rtmlG1B9e1KAPV6U4TG5PoAhj4vXNAeOjZzd+aVlx68Wz2c
 RJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793727550; x=1794332350;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9NBCIEHRgd8QJgxxWBvLpMiBLQCIalRd36PHwtlBQLk=;
 b=DxNIMlj65CIU9a/2AB/lzVl+SZNqf7UfflM87yIFdnUwYFCvpZCQRv2y6wAgBJWjP0
 1wetb24vsm6YYiHSX7ACfhGAWYSgOUGFbCjDFT0JqA218jiaOk2K1WsvFoHoP4VTw4rD
 jKoBce5OXyP2FVd+Y5ntauMd77lSAOr2dcDOrm8xsTyWfbAk7MM3Ob71C/+Kmt/V6FiL
 h2PpcabtM/79TZzuNbg2P4woN5d4qpXjjakTmo6Rk13ZnOMwBtPqjqpo3IDzpV7QnA5t
 I77AgPbcCAaPOnsPpCJeyUZCBk5GagIF/8tRcLJl9zbwUD1SaxeNlE/I/YXIRy6290sz
 BPtA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzfdvSlYopQAN5kxN2FJt2GPZ5Z/c6gdUexImsuMdhCzD6cab6SGm995HwbVVh2AV9o9HTS4GoV@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8LZRQ7nrgJAQyi6Hvg1GNqD3qvC4rAR4Ub0IYsFgxOPP57aW7S
 0UDDJtYULeQ0dEiKzBmQrbkW9NZ9RCFc44IMy0nTwXzhCjP90GKzJntX5tT9zkZOM7qb9UNjh4k
 LFOnZ6uMgghkJcL718ePpbFGaVcO6Dvv9l0qSFHjzwfaeNoN9lfawOL87YXTUvsCgU4Nc
X-Gm-Gg: AYBFou0/PqxZUUmbnL5mYTIWPy6+ibU2+06j/CI3olYZOZhaVp3hx5Jx4jh712nNi86
 V2gFn6QGeIkFXZ2fBBR0hUAa4NEZB9cY8s8jxUyC2+D66DsZNct9vFuahtlxdLdRedGQS0kGemZ
 DIHWCJOhcx6d54jse/yp9RDtls65YWeVOGqgFXOalwlZRnCHeYpCq7KcZKhJQm7WTZ0k+eef+oD
 kW100dGMjPYUw8TyWFQeYg4UvFZMbAZ9X0epVfZ1DPLcvBXd71D4aJ0iX+YcHZqK5I+KKFmioXt
 uLS8BwybDHCT7aNdbpGnOoubc10aYpm5NAdhMAbncMlWuwKCmoKFqPaWTq5pntE7liHkDWYTK/B
 gqhM2IjkThmtAKgkW4euio9qASqU7euhfZ8s9ipPqG4K65l8BEKktg1bCMJQk2I7gM42fWg==
X-Received: by 2002:a05:7301:18af:b0:36c:9b35:5d45 with SMTP id
 5a478bee46e88-36c9b356dd1mr2254777eec.25.1793727544888; 
 Tue, 03 Nov 2026 09:39:04 -0800 (PST)
X-Received: by 2002:a05:7301:18af:b0:36c:9b35:5d45 with SMTP id
 5a478bee46e88-36c9b356dd1mr2254741eec.25.1793727544259; 
 Tue, 03 Nov 2026 09:39:04 -0800 (PST)
Received: from [192.168.1.7] ([106.222.229.43])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a42662f23sm55400419eec.2.2026.11.03.09.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 09:39:03 -0800 (PST)
Message-ID: <12b47f0f-97b2-49e3-a347-761d0394daca@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 23:08:58 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 0/2] tests/msm/msm_bo: Add mapping and free tests
To: Jitta Vignan <jvignan@qti.qualcomm.com>, igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 kamil.konieczny@linux.intel.com, spatraya@qti.qualcomm.com
References: <20261103171322.2729929-1-jvignan@qti.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261103171322.2729929-1-jvignan@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MCBTYWx0ZWRfX0F39aMmNEEJX
 JoB0gzy2hFLw0A6AbMPrhMEH2M6a6ef4Kaw0OOYDHt6OKX2uOenIF7harJBCvdKjE88B4I4OpNj
 jbLBmibXkimrko4zyKGXVuYy5S4IuEs=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea1c3e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=+m4bPbj4bahp+20XAXQLFw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wbr4qwtMgWoj88hWMVEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: XrOjWCTm87j4dGjtFS22X_tqDxGARYTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MCBTYWx0ZWRfX2YQvaBW+jwwM
 wh2V8qygdbMgEwUqys9Xc3igGgkteiC1Ymmu6ZkLLXljfSSj2NaBV1Wr+/6wMnYx4pUhsFvIT9F
 4/y0kopkVNwwh+9BPop+l7MF1Ufp3eT93fXzrjTdmWyWyPUOgUJUoavUkJ6GJYsbnHS0z8akGnw
 JCgDM5Y3lgWZKQj5vsq8EutDcjSB5t2B0qwyBXhW8ES5H7+hTlmqydUI53j14y/o25bAPvRTqTf
 FX52Iuft/FNbnLyUuSJbA59Qtl7316JOEyrrafIyrrKyVNa8iIhpdIQ/w5owBVR7eLRWGIdbujI
 7uVM+1HcyociRZ65Ce6kXWDvwyJ/y+TGVDjp1y/6zAKVNGH2oAz/qF+982+C/vJLsYB+7WZ/jxh
 IyosRs7zhb0okCQbwlLOBrjCYmh/s/eLvAQFbBrf2e1I3hm/6x77QqKXkIK1XW46elKj+n0cWWS
 Cqyt+790KWRiu0u+84Q==
X-Proofpoint-GUID: XrOjWCTm87j4dGjtFS22X_tqDxGARYTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030070
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/2026 10:43 PM, Jitta Vignan wrote:
> Extend MSM buffer object coverage with mapping and free operations.
> 
> Add positive and negative coverage for buffer mapping operations,
> including different cache modes, repeated mappings, remapping,
> different buffer sizes, CPU preparation, protection flags, partial
> mappings, and invalid mapping requests.
> 
> Add positive and negative coverage for freeing buffer objects,
> including multiple buffers, invalid handles, repeated close requests,
> and queries after a buffer has been released.
> 
> Changes in v2:
> - Rebase onto the latest upstream master.
> - Resolve conflicts with recently applied MSM BO changes.
> - Add Acked-by and Tested-by tags.
> 
> Jitta Vignan (2):
>   tests/msm/msm_bo: Add buffer mapping tests
>   tests/msm/msm_bo: Add buffer free tests
> 
>  tests/msm/msm_bo.c | 570 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 570 insertions(+)
> 

For the whole series:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>


-Akhil.

