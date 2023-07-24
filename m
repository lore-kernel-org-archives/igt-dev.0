Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 24 Jul 2023 09:25:15 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZL6l63g2BhHwXaAO@nvishwa1-DESK>
References: <20230724155705.3700630-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230724155705.3700630-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH igt] tests/xe_create: Bump max time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 08:57:05AM -0700, Lucas De Marchi wrote:
>For our kernel with debug and kasan enabled, 2 seconds is not enough to
>create 2048 engines. In CI we are seeing it failing sometimes for ADL-P:
>
>	CRITICAL: Creating 2048 engines tooks too long: 2 [limit: 2]
>
>And for ATS-M:
>
>	CRITICAL: Creating 2048 engines tooks too long: 3 [limit: 2]
>
>Let's bump it to 5 to cover all cases and give it some room for
>early-enabling platforms.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tests/xe/xe_create.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
>index 2e29efc90..e39e89f7a 100644
>--- a/tests/xe/xe_create.c
>+++ b/tests/xe/xe_create.c
>@@ -120,7 +120,7 @@ static uint32_t __xe_engine_create(int fd, uint32_t vm,
> }
>
> #define MAXENGINES 2048
>-#define MAXTIME 2
>+#define MAXTIME 5
>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

> /**
>  * SUBTEST: create-engines-%s
>-- 
>2.40.1
>
