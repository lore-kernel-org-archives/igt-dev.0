Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B488CD609D7
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 19:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F0210E07E;
	Tue, 16 Dec 2025 19:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="jnk7YVWb";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E46510E07E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 19:02:45 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so60697365e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 11:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765911764; x=1766516564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cpcab4uCrLp2JbctScJGs9O1jLNtdoX6semdL2q/ZCE=;
 b=jnk7YVWbovXxYXCIYVqHz8lk2+53NcguDNB7sd4Y6LHGyF7H3PIbw4LjrBDKKw8Ww9
 7aOq6qGrxmBF3hyXGEZSpcNtJNUn7aIAyIoXB0tXM7FZOphxqiXcQxN60qr1ai9xiII4
 QsEbS9V939h57LE5qN9HkaXOZArPscSW8hyYbt4IJJW6XpEc2b5IBDr9/4R9BtoJ7QmN
 36NOUI1EXAHveup2rUlZoximz1O6sBYx0CKNhhFKDou37yk3v45RFU71TZ4qlg/sOcD1
 PVQmCCP458Z4V/EjgGGXFUtUoqrjvLYJX9vvw8TOC9O20pWuZwPkz82Zs/Zi895Oduln
 UQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765911764; x=1766516564;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cpcab4uCrLp2JbctScJGs9O1jLNtdoX6semdL2q/ZCE=;
 b=mOBLYCjyQcbU+PNl3x8Wi39XYYXBBFM+A2JPTFO/XxKYdy9bn8k6qUqpluQN7LjIch
 GiyNp58uP6o0EkCWuQXg5Ytkl0F14lT7jPX/70AMlR9Gy0Vd4ZcP1eT2/N99gbukfKN7
 HOfjrOiMG/zx4p+OGmtdmtNYd2HRiDxPJ2zXmRiy5a6jKepSfXbY+HmjXWws7nKPzp2O
 k7j9EHr8X9tVgUeBNbQ6hlRLkgpSLawHqz4VlTEyk0qxhFOcARvMMH7XNYHN8JzKi8IJ
 ev2+XmyXCT47534eUWqGbnFgyXoN3eKpXZgzsL9AJQ4yYZBzOHArtYq17nR3YykEO62a
 sJuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1ABKsUGv+HJmADh1SexfFxj4cQMkWutRj6ew1FduiDkO9ueYLFIA2/LT5OTgnRb9h3wWYjHZB@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx5wAges5eB/U2VNLfqK32GBEi9ms7qzPLTHThXbtYyEs38eNH
 eFq7t8EWvVZZKYRcyzY1kupDVrh97E0BOpEQ8WvnKLukQoLS2E2djWI2cl7U7nZegxo=
X-Gm-Gg: AY/fxX6FWqFUNYmNSl1yGqJP1+pmTRXwEC6kc8MMiiMJV4n95o5EK2UjKks24hSOve8
 eAAnGL2QYn/4kHwjCsXaKmhjMGO3PXuiC2yYA5Z1KuohsYv31HLuOAxPllavf4mymygXQ76aAKP
 vPsThd3Cs62k6rXq8d7h9AD0px/ivkuuJHBpDqwJWyWdNT5s8Y1gCMoxrng7PO5VUGkQf4rUWlL
 /QIOmqOcu+Bqu5cScgOeY1Qkf9IN+C2IyvCyqvpsrPn5+YfqylZ50l74go8sb+2G/mswW8LqOQV
 Og7wz+fL3YAeeMwsmIoH9ZtMK7w0lRXTfjptIDRNiTNe96vlC8wBkmfqxo59EJe62Fco5efMJ4F
 SKwi3bv8t6pKyhG8qOwmRsu69uAO3VaP8WQKX6oQfZ2sCLQoIRLfuRnM+R8an55akDO/jeyfDoR
 ASEyvHnP2WXOsS/z/VbkIhN38S7Tz0/JOyF77CE1UAWvg=
X-Google-Smtp-Source: AGHT+IGUdJCloajI8wZk7oFm9CsmfEDTe+06NqV6k2+FRWL1Ez+y3CXO8Ih6/0oxasHe1Z0V0vFPsg==
X-Received: by 2002:a05:6000:250c:b0:431:8f8:7f2e with SMTP id
 ffacd0b85a97d-43108f8814emr2561999f8f.33.1765911763101; 
 Tue, 16 Dec 2025 11:02:43 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4310ada846bsm598615f8f.9.2025.12.16.11.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 11:02:42 -0800 (PST)
Message-ID: <257cafe7-a9ff-47d1-a862-488305b169a5@ursulin.net>
Date: Tue, 16 Dec 2025 19:02:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: prevent losing original
 pointer on realloc failure
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <dda88be9f499aec000d32ea52b4baf18751d9de5.1765809053.git.sebastian.brzezinka@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <dda88be9f499aec000d32ea52b4baf18751d9de5.1765809053.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 15/12/2025 14:45, Sebastian Brzezinka wrote:
> Previously, realloc was called directly on engines after incrementing
> num_engines. If realloc failed, it would return NULL and overwrite the
> original pointer, causing a memory leak and leaving engines inaccessible.
> This patch uses a temporary pointer for realloc and only updates engines
> after a successful allocation, ensuring the original pointer is preserved
> on failure and preventing data loss.

I don't see a memory leak, or any other problem really. If realloc fails 
the flow is this:

static struct engines *discover_engines(char *device)
{
...
		engines = realloc(engines, sizeof(struct engines) +
				  engines->num_engines * sizeof(struct engine));
		if (!engines) {
			ret = errno;
			break;
		}
...
	if (ret) {
		errno = ret;
		goto err;
	}
...
	return NULL;


<back to main>

	engines = discover_engines(pmu_device);
	if (!engines) {
		fprintf(stderr,
			"Failed to detect engines! (%s)\n(Kernel 4.16 or newer is required 
for i915 PMU support.)\n",
			strerror(errno));
		ret = EXIT_FAILURE;
		goto err_engines;
	}

So tools exits with an error message. Maybe I am blind but, again, I 
don't see a problem?

Regards,

Tvrtko

> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>   tools/intel_gpu_top.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 1bd88ba7c..1d0d11585 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -378,6 +378,7 @@ static struct engines *discover_engines(char *device)
>   	while ((dent = readdir(d)) != NULL) {
>   		const char *endswith = "-busy";
>   		const unsigned int endlen = strlen(endswith);
> +		struct engines *engines_tmp;
>   		struct engine *engine =
>   				engine_ptr(engines, engines->num_engines);
>   		char buf[256];
> @@ -444,14 +445,15 @@ static struct engines *discover_engines(char *device)
>   			break;
>   		}
>   
> -		engines->num_engines++;
> -		engines = realloc(engines, sizeof(struct engines) +
> -				  engines->num_engines * sizeof(struct engine));
> -		if (!engines) {
> +		engines_tmp = realloc(engines, sizeof(struct engines) +
> +				  (engines->num_engines + 1) * sizeof(struct engine));
> +		if (!engines_tmp) {
>   			ret = errno;
>   			break;
>   		}
>   
> +		engines = engines_tmp;
> +		engines->num_engines++;
>   		ret = 0;
>   	}
>   

