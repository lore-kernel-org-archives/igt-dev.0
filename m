Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFD110EF29
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 14:21:47 +0000 (UTC)
Message-ID: <0b0580c2-449e-7260-cee0-9ef9fb6edf09@intel.com>
Date: Wed, 13 Apr 2022 15:59:00 +0200
Content-Language: en-US
References: <cover.1649753814.git.mchehab@kernel.org>
 <9a0552078e4e27744894799bad47920f8c145dec.1649753814.git.mchehab@kernel.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <9a0552078e4e27744894799bad47920f8c145dec.1649753814.git.mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 12/12] code_cov_parse_info: add support for
 generating html reports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Ch
 Sai Gowtham <sai.gowtham.ch@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 12.04.2022 10:59, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> While lcov has already its own report generator, it is interesting
> to be able to deal with multiple files exposing each input in
> separate.
>
> So, add new command line parameters to allow it to generate html
> reports. Also add some command lines to setup html title, add a
> css file and include a prolog/epilog at the html body.
>
> The title option can also be useful to rename the titles when
> merging multiple info files.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>

I wouldn't say I've enough patience to analyze everything :), so:

Acked-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
