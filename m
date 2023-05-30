Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319B610E16D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 15:12:00 +0000 (UTC)
Message-ID: <69e4bd89-3758-b22e-fe4f-c03d7ce45738@intel.com>
Date: Tue, 30 May 2023 20:41:54 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
 <20230529052835.860047-82-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230529052835.860047-82-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V4 81/82] tests/testdisplay: Document each
 subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 29-May-23 10:58 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/testdisplay.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
> index ee272dfb2..ac696c7fe 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -69,6 +69,19 @@
>   #include <stdlib.h>
>   #include <signal.h>
>   
> +/**
> + * TEST: testdisplay
> + * Category: Display
> + * Description: Tests basic display functionality.
> + *
> + * SUBTEST:

Test description and subtest description should differ.
By default this test will do modeset with different modes only.

> + * Description: Tests basic display functionality.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   IGT_TEST_DESCRIPTION("Tests basic display functionality.");
>   
>   enum {
