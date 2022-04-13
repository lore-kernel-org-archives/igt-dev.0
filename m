Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7188D10E777
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 14:08:38 +0000 (UTC)
Message-ID: <2b01e83c-9e1d-09a1-630a-a03767633f0e@intel.com>
Date: Wed, 13 Apr 2022 15:53:01 +0200
Content-Language: en-US
References: <cover.1649753814.git.mchehab@kernel.org>
 <44750fbf7c569f1da80a8f443b07df963730e28f.1649753814.git.mchehab@kernel.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <44750fbf7c569f1da80a8f443b07df963730e28f.1649753814.git.mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 11/12] code_cov_parse_info: add support for
 exclude filters
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
> It is interesting to have support not only for including, but
> also for excluding functions and files. Also, it is trivial to
> have support for it.
>
> When either one or both source/function filters are enabled, it
> will print at the console the regular expressions that are applied
> to functions and sources (if any), e. g.:
>
> $ cat << END >f1
> +i915
> gem
>
> -  display
> -selftest
> END
> $ cat << END >f2
> 	-/selftests
> END

I am not sure if we really needs so tolerant parser, up to you.

> $ code_cov_parse_info dg1.info dg2.info --func-filter f1 --source-filters f2 --stat

s/func-filter/func-filters/

Btw, maybe would be good to have inline fliters:

$ code_cov_parse_info dg1.info dg2.info --func-filter '+i915,+gem,-display,-selftest' --source-filters '-/selftest' --stat

For this I would make '+/-' at the beginning required, just an idea, 
could be implemented later.

>    lines......: 72.1% (176 of 244 lines)
>    functions..: 77.3% (17 of 22 functions)
>    branches...: 50.0% (68 of 136 branches)
> Filters......: function regex (not match: m`display` m`selftest` and match: m`i915` m`gem`), source regex (match: m`/selftest`) and ignored source files where none of its code ran.

I would use then here "+i915,+gem,-display,-selftest" format, just 
shorter lines.

> Source files.: 0.99% (7 of 710 total), 77.78% (7 of 9 filtered)
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---


With fixed typo, and optionally implemented suggestions:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
