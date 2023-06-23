Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483A810E5D0
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 03:21:58 +0000 (UTC)
Message-ID: <8b8f4217-e95f-f1db-25e2-58462d07f5a9@intel.com>
Date: Fri, 23 Jun 2023 08:51:36 +0530
Content-Language: en-US
References: <20230622123014.4184296-1-mauro.chehab@linux.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230622123014.4184296-1-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_fb_coherency: add
 mega-feature and functionality
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: jari.tahvanainen@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On Thu-22-06-2023 06:00 pm, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> This test is currently missing mega-feature and functionality.
> Add them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>   tests/i915/kms_fb_coherency.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/kms_fb_coherency.c b/tests/i915/kms_fb_coherency.c
> index b530bf5dcd70..ba0ea7068fdf 100644
> --- a/tests/i915/kms_fb_coherency.c
> +++ b/tests/i915/kms_fb_coherency.c
> @@ -6,6 +6,8 @@
>   /**
>    * TEST: kms_fb_coherency
>    * Description: Exercise coherency of future scanout buffer objects
> + * Mega feature: General Display Features
> + * Functionality: crc

For display tests, "Mega feature" & "Functionality" should be at SUBTEST 
level.

Also, Functionality must be gtt or kms_gem_interop, since this test is 
trying to validate different mappings.

- Bhanu

>    */
>   
>   #include <errno.h>

