Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AC510E50A
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:12 +0000 (UTC)
Date: Tue, 25 Apr 2023 12:26:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ksgoxb6ckd3zgsw6idc5tsbhlfh75vpkan5qjkipypk2tp3mea@l7j62hqq47dl>
References: <20230414173408.3584070-1-lucas.demarchi@intel.com>
 <20230425161226.bnmqdizvmn7sbwjd@kamilkon-desk1>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230425161226.bnmqdizvmn7sbwjd@kamilkon-desk1>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] intel-gfx-fw-info: Make it compatible
 with HuC via GSC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 06:12:26PM +0200, Kamil Konieczny wrote:
>Hi,
>
>On 2023-04-14 at 10:34:08 -0700, Lucas De Marchi wrote:
>> When HuC is loaded via GSC, the firmware format is different and there
>> is no information for kernel to parse except the version, that is in
>> a different location.  Check for the magic field as the first dword and
>> parse the blob differently based on that.
>>
>> Tesetd with
>---- ^^
>Tested
>
>Could you add "tools/" in subject ? so it will look like:
>
>[PATCH i-g-t] tools/intel-gfx-fw-info: Make it compatible with HuC via GSC
>
>Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

done and pushed. Thanks

Lucas De Marchi
