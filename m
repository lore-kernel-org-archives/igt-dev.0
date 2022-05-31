Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78AC10EDDC
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 14:41:16 +0000 (UTC)
Message-ID: <314ca5a8-4760-bd28-4703-aa32aebcce83@igalia.com>
Date: Tue, 31 May 2022 11:40:49 -0300
MIME-Version: 1.0
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>
References: <20220531084929.28679-1-karthik.b.s@intel.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20220531084929.28679-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v7 0/2] tests/kms_async_flips: Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



Às 05:49 de 31/05/22, Karthik B S escreveu:
> Series includes patches to:
> -Convert tests to dynamic
> -Cleanup the test
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> 
> Karthik B S (2):
>   tests/kms_async_flips: Convert tests to dynamic
>   tests/kms_async_flips: Test Refactoring
> 
>  tests/kms_async_flips.c | 235 +++++++++++++++++++++++++---------------
>  1 file changed, 146 insertions(+), 89 deletions(-)
> 


Reviewed-by: André Almeida <andrealmeid@igalia.com>

Also, I've tested with an AMD GPU and everything seems to be working as
before.
